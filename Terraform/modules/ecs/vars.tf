variable "env" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type = string

  description = "AWS region"
}

variable "execution_role_arn" {
  type        = string
  description = "Execution Role ARN"
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "image_name" {
  description = "Name of the docker image"
  type        = string
}

variable "container_port" {
  description = "Listen container port"
  type        = number
}

variable "cpu" {
  description = "CPU units for the container"
  type        = number
}

variable "memory" {
  description = "Memory allocation for the container"
  type        = number
}

variable "desired_count" {
  description = "ECS service number of containers to deploy"
  type        = number
}
variable "launch_type" {
  type        = string
  description = "ECS launch type"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnets IDs"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security Group IDs"
}

variable "tg_ecs_fargate_arn" {
  description = "Target Group ARN of the ECS Fargate"
  type        = string
}
