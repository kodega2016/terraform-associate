# Terraform Data
We can get the aws resource information using `data` in terraform.

## Data Source
Data source is used to fetch the information of the existing resources in the cloud.
That information can be used in the terraform configuration.

## Example
```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
```