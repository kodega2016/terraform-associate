resource "aws_s3_bucket" "public_assets" {
  bucket = "public-assets"
  tags = {
    Name   = "public-assets"
    Author = "kodega"
  }
}

resource "aws_s3_bucket" "private_assets" {
  bucket = "private-assets"
  tags = {
    Name   = "private-assets"
    Author = "kodega"
  }

  provider = aws.east-2
}