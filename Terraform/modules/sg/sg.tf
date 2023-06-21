resource "aws_security_group" "alb" {

  name        = "ALB-SG"
  description = "Allow traffic for load balancers"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = { for i, v in var.alb_sg_ingress : i => v }

    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidrs

    }
  }
  dynamic "egress" {
    for_each = { for i, v in var.alb_sg_egress : i => v }

    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidrs

    }
  }

  tags = {
    Name        = "ALB-SG"
    Description = "Allow traffic for load balancers"
  }
}

resource "aws_security_group" "ecs" {

  name        = "ECS-SG"
  description = "Allow traffic for ECS"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = { for i, v in var.ecs_sg_ingress : i => v }
    content {
      description     = ingress.value.description
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = [var.vpc_cidr_block]
    }
  }
  dynamic "ingress" {
    for_each = { for i, v in var.ecs_sg_ingress : i => v }
    content {
      description     = ingress.value.description
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [aws_security_group.alb.id]
    }
  }

  dynamic "egress" {
    for_each = { for i, v in var.ecs_sg_egress : i => v }
    content {
      description     = egress.value.description
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      security_groups = [aws_security_group.alb.id]
    }
  }


  tags = {
    Name        = "ECS-SG"
    Description = "Allow traffic for ECS"
  }
}
