locals {
  common_tags = {
    author           = "kode"
    is_from_terrafom = "yes"
  }
}

resource "aws_vpc" "kode_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "kode_vpc"
  })

}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.kode_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = merge(local.common_tags, {
    Name = "public_subnet"
  })
}


resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.kode_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = merge(local.common_tags, {
    Name = "private_subnet"
  })
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kode_vpc.id

  tags = merge(local.common_tags, {
    Name = "kode_igw"
  })

  depends_on = [
    aws_vpc.kode_vpc
  ]
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.kode_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = merge(local.common_tags, {
    Name = "kode-route-table"
  })
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}
