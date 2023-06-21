data "aws_ecr_repository" "ecr" {
  name = "cloudzone-lab"
}

resource "aws_vpc_endpoint" "ecr" {

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.region}.ecr.dkr"

  vpc_endpoint_type   = var.vpc_endpoint_type
  private_dns_enabled = var.private_dns_enabled

  security_group_ids = var.security_group_ids

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "ECR"
    Description = "VPC Endpoint for ECR ${var.env} environment"
  }

}
resource "aws_vpc_endpoint" "ecr_api" {

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.region}.ecr.api"

  vpc_endpoint_type   = var.vpc_endpoint_type
  private_dns_enabled = var.private_dns_enabled

  security_group_ids = var.security_group_ids

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "ECR API"
    Description = "VPC Endpoint for ECR API ${var.env} environment"
  }

}

resource "aws_vpc_endpoint" "ecr_s3" {

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.region}.s3"

  vpc_endpoint_type = "Gateway"

  tags = {
    Name        = "ECR S3"
    Description = "VPC Endpoint for ECR S2 ${var.env} environment"
  }

}

resource "aws_vpc_endpoint" "ecs" {

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.region}.ecs"

  vpc_endpoint_type   = var.vpc_endpoint_type
  private_dns_enabled = var.private_dns_enabled

  security_group_ids = var.security_group_ids

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "ECS"
    Description = "VPC Endpoint for ECS ${var.env} environment"
  }

}
resource "aws_vpc_endpoint" "ecs-agent" {

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.region}.ecs-agent"

  vpc_endpoint_type   = var.vpc_endpoint_type
  private_dns_enabled = var.private_dns_enabled

  security_group_ids = var.security_group_ids

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "ECS-agent"
    Description = "VPC Endpoint for ECS Agent ${var.env} environment"
  }

}
resource "aws_vpc_endpoint" "ecs-telemetry" {

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.region}.ecs-telemetry"

  vpc_endpoint_type   = var.vpc_endpoint_type
  private_dns_enabled = var.private_dns_enabled

  security_group_ids = var.security_group_ids

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "ECS-telemetry"
    Description = "VPC Endpoint for ECS-telemetry ${var.env} environment"
  }

}
