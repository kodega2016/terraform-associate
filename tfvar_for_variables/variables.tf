variable "aws_region" {
  type        = string
  description = "This is the default region for the aws resources"
}
variable "instance_type" {
  type        = string
  description = "This is the instance type for the instance"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Instance type must be either t2.micro or t3.micro"
  }
}

variable "instance_ami" {
  type        = string
  description = "This is the default ami image id"
}

variable "common_tags" {
  type        = map(string)
  description = "This is the common tags for all the resources"
}
