terraform {
  required_version = ">= 0.13"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.78.0"
    }
  }
}
