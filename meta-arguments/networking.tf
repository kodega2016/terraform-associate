locals {
  common_tags = {
    is_created_by_terraform = true
    project                 = "vpc and ec2"
  }
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags       = merge(local.common_tags, { Name = "kodega-vpc" })
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.0.0/24"

  tags = merge(local.common_tags, {
    Name = "kodega-public-subnet"
  })
}
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.common_tags, {
    Name = "kodega-internet-gateway"
  })
}


resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }


  tags = merge(local.common_tags, {
    Name = "kodega-route-table"
  })
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.this.id
}
