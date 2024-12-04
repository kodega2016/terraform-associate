data "aws_ami" "ubuntu_us" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_ami" "ubuntu_eu" {
  most_recent = true
  provider = aws.aws_eu

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


output "ubuntu_ami_data_us" {
  value = data.aws_ami.ubuntu_us.id
}

output "ubuntu_ami_data_eu" {
  value = data.aws_ami.ubuntu_eu.id
}