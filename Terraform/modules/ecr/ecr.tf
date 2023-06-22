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

  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [var.private_rt_id]

  tags = {
    Name        = "ECR S3"
    Description = "VPC Endpoint for ECR S2 ${var.env} environment"
  }

}
