

resource "aws_ecs_cluster" "this" {
  name = "cloudzone-ecs-cluster"

  tags = {
    Name        = "ECS Cluster"
    Description = "ECS for ${var.env} environment"
  }
}


# Create ECS task definition
# # ERROR
# Task stopped at: 6/19/2023, 19:52:49 UTC
# ResourceInitializationError: unable to pull secrets or registry auth: execution resource retrieval failed: unable to retrieve ecr registry auth: service call has been retried 3 time(s): RequestError: send request failed caused by: Post "https://api.ecr.us-east-1.amazonaws.com/": dial tcp 44.213.79.86:443: i/o timeout. Please check your task network configuration.

# Direction
# - https://repost.aws/knowledge-center/ecs-tasks-pull-images-ecr-repository
# - SG
# - VPC Endpoing
# - RT

resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "cloudzone-task"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = var.execution_role_arn
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
  name            = "ecs-servic"
  cluster         = aws_ecs_cluster.this.name
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = var.desired_count
  launch_type     = var.launch_type


  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = var.security_group_ids
  }

  load_balancer {
    target_group_arn = var.tg_ecs_fargate_arn
    container_name   = var.image_name
    container_port   = var.container_port
  }

  tags = {
    Name        = "ECS Service"
    Description = "ECS service for managing the task definition"
  }
}

