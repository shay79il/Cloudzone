
variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
}

variable "instance_tenancy" {
  type        = string
  description = "VPC Instance Tenancy"
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = string
}

variable "env" {
  type        = string
  description = "VPC Environment"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "subnets" {
  type = map(object({
    az     = string
    cidr   = string,
    public = bool
  }))
  description = "VPC Subnets"
}
