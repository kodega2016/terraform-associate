output "website_url" {
    value = aws_s3_bucket.static_website.bucket_domain_name
}