# Terraform Providers
We can also provide the multiple provider with the alias name.we can use the alias name to use the provider in the resource block.

```hcl
provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
```

After that, we can use the alias name in the resource block to use the provider.

```hcl
resource "aws_instance" "example" {
  provider = aws.us_east_1
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```