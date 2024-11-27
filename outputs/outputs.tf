output "bucket_arn" {
  value       = aws_s3_bucket.test-bucket.arn
  description = "The ARN of the bucket"
}
