resource "aws_s3_bucket" "public_assets" {
  bucket = "kodega-public-assets"

  tags = {
    Name              = "kodega-public-assets"
    Author            = "kodega2016"
    is_from_terraform = true
  }
}