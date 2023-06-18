resource "aws_subnet" "this" {
  for_each = { for k, v in var.subnets : k => v }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr
  availability_zone       = join("", [var.region, each.value.az])
  map_public_ip_on_launch = each.value.public

  tags = {
    Name        = each.key
    Description = "Subnet for ${var.env} environment"
  }
}