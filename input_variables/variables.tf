variable "aws_region" {
  default     = "us-east-1"
  description = "the default region for the aws resources"
  type        = string
}

variable "ec2_instance_size" {
  default     = "t2.micro"
  type        = string
  description = "This is the default ec2 instance type"
}

variable "allow_public_ip_address" {
  type        = bool
  default     = false
  description = "This is the flag to assign public ip address to ec2 instance,default is false"
}
variable "common_tags" {
  type        = map(string)
  description = "This is the common tags for all the resources"
  default = {
    "Author"      = "biku"
    "Purpose"     = "Demo"
    "is_from_iac" = true
  }

}
