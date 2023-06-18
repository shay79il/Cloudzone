resource "aws_default_route_table" "public_rt" {
  default_route_table_id = aws_vpc.this.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name        = "PublicRT"
    Description = "Default route table for ${var.env} environment"
  }
}

resource "aws_route_table_association" "public" {
  for_each = toset([for k, v in var.subnets : k if v.public])

  subnet_id      = aws_subnet.this[each.value].id
  route_table_id = aws_default_route_table.public_rt.id
}

# # TODO aws_route_table - Do I need it?
# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.this.id

#   route {
#     cidr_block = var.vpc_cidr_block
#     vpc_endpoint_id = aws_vpc_endpoint.ecr.id
#   }

#   tags = {
#     Name = "PrivateRT"
#     Description = "Private route table for ${var.env} environment"
#   }
# }

# TODO aws_route_table_association - Do I need it?
# resource "aws_route_table_association" "private_rt" {
#   for_each = toset([for sub_name, v in var.subnets : sub_name if !v.public])

#   subnet_id      = aws_subnet.this[each.value].id
#   route_table_id = aws_route_table.private_rt.id
# }
