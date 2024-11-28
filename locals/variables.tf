variable "resource_tags" {
  type        = map(string)
  description = "A map of tags to apply to resources"
  default = {
    project     = "kode-project"
    environment = "dev"
  }
}
