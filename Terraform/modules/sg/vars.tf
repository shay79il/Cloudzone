variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}

variable "alb_sg_ingress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidrs       = list(string)
  }))

  description = "Ingress rules for the ALB Security Group"
}

variable "alb_sg_egress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidrs       = list(string)
  }))

  description = "Egress rules for the ALB Security Group"
}

variable "ecs_sg_ingress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string
  }))

  description = "Ingress rules for the ECS Fargate Security Group"
}

variable "ecs_sg_egress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidrs       = list(string)
  }))

  description = "Egress rules for the ALB Security Group"
}