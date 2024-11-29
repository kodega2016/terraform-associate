variable "resource_tags" {
  type        = map(string)
  description = "A map of tags to apply to resources"
  default = {
    project     = "kode-project"
    environment = "dev"
  }
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets"
  default = [
    "10.0.0.0/24",
  ]
}
