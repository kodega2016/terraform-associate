output "domain-name" {
  value       = aws_instance.web.public_dns
  description = "The public DNS name of the web server"
}
