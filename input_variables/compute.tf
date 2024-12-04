resource "aws_instance" "webserver" {
  ami                         = "ami-0453ec754f44f9a4a"
  instance_type               = "t3.micro"
  associate_public_ip_address = false


  tags = {
    Author  = "bikue"
    Purpose = "Demo"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }
}
