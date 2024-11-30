resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-demo-bucket"

  tags = {
    Name        = "mu-demo-bucket"
    Environment = "Dev"
    Author      = "kodega"
    is_from_terraform=true
  }
}
