# Variables in Terraform

We can define Variables in terraform using `variable` keyword.

```hcl
variable "aws_region"{
  type=string
  default="us-east-1"
  description="This is default region for the aws resources"
}
```

We also can pass the variable in the cli also.

```bash
terraform apply -var aws_region=us-east-2
```

## Variable validation

We can also add validation to have certain rules and validation.For example.
If we want to only have instance type `t2.micro` and `t3.micro`, we can apply the following
validation rules.

```hcl
variable "ec2_instance_size" {
  default     = "t2.micro"
  type        = string
  description = "This is the default ec2 instance type"

  validation {
    # condition     = var.ec2_instance_size == "t2.micro" ||
    ## var.ec2_instance_size == "t3.micro"
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_size)
    error_message = "Only supports t2.micro or t3.micro"
  }
}
```
