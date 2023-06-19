resource "aws_lb" "application" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Name        = "ALB"
    Description = "ALB for the ECS"
  }

  lifecycle {
    create_before_destroy = true
  }
}