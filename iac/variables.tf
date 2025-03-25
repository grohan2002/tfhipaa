variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc_cidrs" {
  type        = map(string)
  description = "CIDR blocks for the VPCs"
  default = {
    mgmt    = "10.1.0.0/16"
    dev     = "10.2.0.0/16"
    staging = "10.3.0.0/16"
    prod    = "10.4.0.0/16"
  }
}