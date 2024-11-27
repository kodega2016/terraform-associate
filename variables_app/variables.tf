variable "filename" {
  type        = string
  default     = "demo.txt"
  description = "This is the file name"
}

variable "content" {
  type        = string
  default     = "Hello World"
  description = "The content of the file"
}

variable "instance_count" {
  type        = number
  default     = 0
  description = "The number of instances to create"
}

variable "instance_types" {
  type        = list(string)
  default     = ["t2.micro", "t2.small"]
  description = "The instance types to create"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default = {
    "department" = "DevOps"
    "terraform"  = true,
  }
}
