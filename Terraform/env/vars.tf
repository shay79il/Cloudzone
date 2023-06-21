# Managment varibles
##########################
variable "aws_cred_paths" {
  type    = list(string)
  default = ["~/.aws/credentials"]

  description = "List of paths to the shared credentials file"
}

variable "aws_profile" {
  type    = string
  default = "CloudZone"

  description = "AWS profile name"
}

variable "aws_account_id" {
  type    = string
  default = "791073934047"

  description = "Allowed AWS account ID"
}

variable "region" {
  type    = string
  default = "us-east-1"

  description = "AWS region"
}

variable "env" {
  type    = string
  default = "Dev"

  description = "Environment name"
}

# IAM module variables
########################

variable "effect" {
  type        = string
  default     = "Allow"
  description = "IAM policy effect"
}
variable "actions" {
  type        = list(string)
  default     = ["sts:AssumeRole"]
  description = "IAM policy effect"
}
variable "principal_type" {
  type        = string
  default     = "Service"
  description = "IAM principal type"
}

variable "principal_identifiers" {
  type        = list(string)
  default     = ["ecs-tasks.amazonaws.com"]
  description = "IAM policy principal identifiers"
}
variable "role_name" {
  type        = string
  default     = "ECSTaskExecuteRole"
  description = "IAM role name"
}
variable "policy_arn" {
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  description = "IAM policy arn for attachment"
}

# VPC module vars
###################

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "172.16.0.0/16"
}

variable "instance_tenancy" {
  description = "VPC Instance Tenancy"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = string
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = string
  default     = true
}

variable "subnets" {
  type = map(object({
    az     = string
    cidr   = string,
    public = bool
  }))

  default = {
    private-az-a = {
      "az"     = "a"
      "cidr"   = "172.16.0.0/24",
      "public" = false
    },
    private-az-b = {
      "az"     = "b"
      "cidr"   = "172.16.1.0/24",
      "public" = false
    }
    public-az-a = {
      "az"     = "a"
      "cidr"   = "172.16.6.0/24",
      "public" = true
    },
    public-az-b = {
      "az"     = "b"
      "cidr"   = "172.16.7.0/24",
      "public" = true
  } }

  description = "VPC Subnets"
}


# SG module vars
###################
variable "alb_sg_ingress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidrs       = list(string)
  }))

  default = [
    {
      "description" = "Allow HTTP from any",
      "from_port"   = 80,
      "to_port"     = 80,
      "protocol"    = "tcp",
      "cidrs"       = ["0.0.0.0/0"],
    }
  ]

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

  default = [
    {
      "description" = "Allow any outbound traffic",
      "from_port"   = 0,
      "to_port"     = 0,
      "protocol"    = "-1",
      "cidrs"       = ["0.0.0.0/0"]
    }
  ]

  description = "Egress rules for the ALB Security Group"
}

variable "ecs_sg_ingress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string
  }))

  default = [
    {
      "description" = "Allow traffic from load balancer",
      "from_port"   = 80,
      "to_port"     = 80,
      "protocol"    = "tcp"
    }
  ]

  description = "Ingress rules for the ECS Fargate Security Group"
}

variable "ecs_sg_egress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string
  }))

  default = [
    {
      "description" = "Allow any outbound traffic",
      "from_port"   = 0,
      "to_port"     = 0,
      "protocol"    = "-1"
    }
  ]

  description = "Egress rules for the ECS Fargate Security Group"
}


# ALB module vars
###################
variable "tg_ecs_fargate_port" {
  type    = number
  default = 80

  description = "The port the ecs fargate receive traffic"
}

variable "tg_ecs_fargate_protocol" {
  type    = string
  default = "HTTP"

  description = "The Protocol to use for routing traffic to ECS Fargate"
}

variable "tg_ecs_tg_type" {
  type    = string
  default = "ip"

  description = "Target Group type for ECS-Fargate"
}

variable "ecs_listeners" {
  type = list(object({
    port     = number,
    protocol = string
  }))

  default = [
    {
      port     = 80,
      protocol = "HTTP"
    }
  ]

  description = "List of objects to set listeners for ECS"
}

variable "enable_deletion_protection" {
  type    = bool
  default = false

  description = "Enable of disable deletion protection for the load balancer"
}


# ECR module variables
##############################
variable "vpc_endpoint_type" {
  type    = string
  default = "Interface"

  description = "VPC endpoint type"
}

variable "private_dns_enabled" {
  type        = string
  default     = true
  description = "Endpoint private dns enabled"
}

# ECS module variables
########################
# TODO Remove START
locals {
  ecs_image_name = "${var.aws_account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.image_name}:latest"
}


#TODO - remove ecs_host_port?
# variable "ecs_host_port" {
#   description = "Host port where the docker container runs"
#   type        = number
#   default     = 80
# }
# TODO Remove END

variable "image_name" {
  description = "Name of the docker image"
  type        = string
  default     = "cloudzone-lab"
}

variable "ecs_container_port" {
  description = "Listen container port"
  type        = number
  default     = 80
}

variable "ecs_container_cpu" {
  description = "CPU units for the container"
  type        = number
  default     = 256
}

variable "ecs_container_memory" {
  description = "Memory allocation for the container"
  type        = number
  default     = 512
}

variable "ecs_service_desired_count" {
  description = "Number of containers to deploy"
  type        = number
  default     = 2
}

variable "launch_type" {
  description = "ECS launch type"
  type        = string
  default     = "FARGATE"
}