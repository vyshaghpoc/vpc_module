data "aws_availability_zones" "main" {}

data "aws_region" "current" {}

locals {
  subnet_number = length(var.sub) > 0 ? var.sub : data.aws_availability_zones.main.names
}

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = var.tags
}

resource "aws_subnet" "main" {
  count      = length(local.subnet_number)
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.cidr_block, var.subnet_bits, count.index)

  tags = {
    Name = "${var.env}-subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "main" {
  count  = length(local.subnet_number)
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-rt-${count.index + 1}"
  }
}

resource "aws_route_table_association" "main" {
  count          = length(local.subnet_number)
  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.main[count.index].id
}
