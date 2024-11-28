
locals {
  name_suffix = "${var.resource_tags["project"]}-${var.resource_tags["environment"]}"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"


  tags = merge(var.resource_tags, {
    Name = "main-${local.name_suffix}"
  })
}
