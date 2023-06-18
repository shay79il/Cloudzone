locals {
  execution_role_arn = "arn:aws:iam::${var.aws_account_id}:role/ecsTaskExecutionRole"
}

resource "aws_ecs_cluster" "this" {
  name = "cloudzone-ecs-cluster"

  tags = {
    Name        = "ECS Cluster"
    Description = "ECS for ${var.env} environment"
  }
}


# Create ECS task definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "cloudzone-task"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = local.execution_role_arn
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  container_definitions = jsonencode([
    {
      name      = var.image_name
      image     = var.image_arn
      essential = true
      portMappings = [
        {
          # hostPort      = var.host_port #TODO - remove hostPort?
          containerPort = var.container_port
        }
      ]
    }
  ])

  tags = {
    Name        = "ECS task definition"
    Description = "Task definition for the container"
  }
}

# Create ECS service
resource "aws_ecs_service" "my_service" {
  name            = "web-server-servic"
  cluster         = aws_ecs_cluster.this.name
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = var.desired_count

  network_configuration {
    subnets =  var.private_subnet_ids
    security_groups = var.security_group_ids
  }

  load_balancer {
    target_group_arn = var.tg_ecs_fargate_arn
    container_name   = var.image_name
    container_port   = 5000 
  }

  tags = {
    Name        = "ECS Service"
    Description = "ECS service for managing the task definition"
  }
}
