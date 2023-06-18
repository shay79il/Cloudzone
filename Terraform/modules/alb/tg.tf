resource "aws_lb_target_group" "ecs_fargate" {
  name     = "ECS-Fargate"
  vpc_id   = var.vpc_id
  port     = var.tg_ecs_fargate_port
  protocol = var.tg_ecs_fargate_protocol
  target_type = var.tg_ecs_tg_type

  health_check {
    port     = var.tg_ecs_fargate_port
    protocol = var.tg_ecs_fargate_protocol
  }

  tags = {
    Name        = "ECS-Fargate TG"
    Description = "Target Group of ECS-Fargate"
  }

  lifecycle {
    create_before_destroy = true
  }
}
