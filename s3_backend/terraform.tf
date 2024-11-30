terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.78.0"
    }
  }

  backend "s3" {
    bucket         = "my-tf-state"
    key            = "state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-dynamodb-table"
    // this is needed for localstack
    endpoint                    = "http://s3.localhost.localstack.cloud:4566"
    force_path_style            = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    access_key                  = "test"
    secret_key                  = "test"
    dynamodb_endpoint           = "http://localhost.localstack.cloud:4566" // Add this line

  }
}
