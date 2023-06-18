output "vpc_id" {
  value = aws_vpc.this.id

  description = "The VPC ID"
}

output "public_subnets_ids" {
  value = [for k, v in var.subnets : aws_subnet.this[k].id if v.public]

  description = "List of public subnets IDs"
}

output "private_subnet_ids" {
  value = [for k, v in var.subnets : aws_subnet.this[k].id if !v.public]

  description = "List of private subnets IDs"
}
