# Variables in Terraform

We can define Variables in terraform using `variable` keyword.

```hcl
variable "aws_region"{
  type=string
  default="us-east-1"
  description="This is default region for the aws resources"
}
```
