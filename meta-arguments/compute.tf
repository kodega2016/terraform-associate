resource "aws_instance" "web" {
  ami                         = "ami-0c601162231abbc5a"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  # user_data = file("user-data.sh")

  vpc_security_group_ids = [
    aws_security_group.public_http_traffic.id
  ]
  root_block_device {
    delete_on_termination = true
  }

  tags = merge(local.common_tags, {
    Name = "web-server"
  })

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group" "public_http_traffic" {
  name        = "public_http_traffic"
  description = "Allow http inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.this.id

  tags = merge(local.common_tags, {
    Name = "public_http_traffic"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = aws_vpc.this.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = aws_vpc.this.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = aws_vpc.this.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
