resource "local_file" "demo_file" {
  filename = var.filename
  content  = var.content
}

resource "aws_s3_bucket" "static_assets" {
  bucket = "my-static-assets-bucket"
}

resource "aws_instance" "web" {
  ami = "ami-0c55b159cbfafe1f0"
  # instance_type = var.instance_types[0]
  for_each      = toset(var.instance_types)
  instance_type = each.value

  tags = merge(
    var.common_tags,
    {
      Name = "instance-${each.value}"
    }
  )
}
