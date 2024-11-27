resource "aws_instance" "web" {
  ami                    = "ami-a0cfeed8"
  instance_type          = "t3.micro"
  user_data              = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "webserver"
  }
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow inbound traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
