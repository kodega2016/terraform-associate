resource "aws_instance" "webserver" {
  ami                         = "ami-0453ec754f44f9a4a"
  instance_type               = var.ec2_instance_size
  associate_public_ip_address = var.allow_public_ip_address


  tags = merge(var.common_tags, {
    Name = "webserver"
  })

  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }
}
