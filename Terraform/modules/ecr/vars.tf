variable "env" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}

variable "vpc_endpoint_type" {
  type        = string
  description = "VPC endpoint type"
}

variable "private_dns_enabled" {
  type        = string
  description = "Endpoint private dns enabled"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnets IDs"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security Group IDs"
}