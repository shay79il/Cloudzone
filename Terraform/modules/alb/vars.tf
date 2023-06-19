variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}

variable "alb_sg_ids" {
  type        = list(string)
  description = "Security Group IDs list for the ALB"
}
variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs list for the ALB"
}

variable "tg_ecs_fargate_port" {
  type = number

  description = "The port the ecs fargate receive traffic"
}

variable "tg_ecs_fargate_protocol" {
  type = string

  description = "The Protocol to use for routing traffic to ECS Fargate"
}

variable "tg_ecs_tg_type" {
  type = string

  description = "Target Group type for ECS-Fargate"
}

variable "ecs_listeners" {
  type = list(object({
    port     = number,
    protocol = string
  }))

  description = "List of objects to set listeners for ECS"
}

variable "enable_deletion_protection" {
  type = bool

  description = "Enable of disable deletion protection for the load balancer"
}