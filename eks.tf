module "mgmt_eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "mgmt-eks"
  enable_fargate  = true
  vpc_id          = module.mgmt_vpc.vpc_id
  subnet_ids      = module.mgmt_vpc.private_subnets
}

module "dev_eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "dev-eks"
  enable_fargate  = true
  vpc_id          = module.dev_vpc.vpc_id
  subnet_ids      = module.dev_vpc.private_subnets
}

module "staging_eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "staging-eks"
  enable_fargate  = true
  vpc_id          = module.staging_vpc.vpc_id
  subnet_ids      = module.staging_vpc.private_subnets
}

module "prod_eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "prod-eks"
  enable_fargate  = true
  vpc_id          = module.prod_vpc.vpc_id
  subnet_ids      = module.prod_vpc.private_subnets
}