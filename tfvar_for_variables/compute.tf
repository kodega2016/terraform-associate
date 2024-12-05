resource "aws_instance" "webserver" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = merge(var.common_tags, {
    Name = "webserver"
  })
}
