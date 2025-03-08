output "mgmt_eks_cluster_name" {
  value = module.mgmt_eks.cluster_name
}

output "dev_eks_cluster_name" {
  value = module.dev_eks.cluster_name
}

output "staging_eks_cluster_name" {
  value = module.staging_eks.cluster_name
}

output "prod_eks_cluster_name" {
  value = module.prod_eks.cluster_name
}