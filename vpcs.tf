module "mgmt_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "mgmt-vpc"
  cidr    = var.vpc_cidrs["mgmt"]
}

module "dev_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "dev-vpc"
  cidr    = var.vpc_cidrs["dev"]
}

module "staging_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "staging-vpc"
  cidr    = var.vpc_cidrs["staging"]
}

module "prod_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "prod-vpc"
  cidr    = var.vpc_cidrs["prod"]
}