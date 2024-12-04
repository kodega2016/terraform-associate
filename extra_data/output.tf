output "aws_id" {
    value = data.aws_caller_identity.aws_info.account_id
}

output "aws_user_id" {
    value = data.aws_caller_identity.aws_info.user_id
}

output "aws_current_region" {
    value = data.aws_region.aws_region.name
}