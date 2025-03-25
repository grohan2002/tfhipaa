# resource "aws_config_configuration_recorder" "main" {
#   name     = "config-recorder"
#   role_arn = aws_iam_role.config_role.arn
# }

# resource "aws_guardduty_detector" "main" {
#   enable = true
# }

# resource "aws_securityhub_account" "main" {}

# resource "aws_securityhub_standards_subscription" "hipaa" {
#   standards_arn = "arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0"
# }