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
    Name        = "VPC Endpoint for ECR"
    Description = "IGW for ${var.env} environment"
  }

}
