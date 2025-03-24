package terraform.security

deny[msg] {
  input.resource_type == "aws_security_group"
  ingress := input.config.ingress[_]
  cidr := ingress.cidr_blocks[_]
  cidr == "0.0.0.0/0"
  msg := sprintf("Security group '%s' allows ingress from 0.0.0.0/0", [input.name])
}