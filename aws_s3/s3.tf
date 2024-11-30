resource "random_id" "bucket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket-${lower(random_id.bucket_suffix.id)}"

  tags = {
    Name        = "my-example-bucket-${lower(random_id.bucket_suffix.hex)}"
    Environment = "Dev"
  }
}
