output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc["sample"].vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc["sample"].public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc["sample"].private_subnet_ids
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc["sample"].nat_gateway_id
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "EKS cluster ARN"
  value       = module.eks.cluster_arn
}

output "eks_node_group_name" {
  description = "EKS managed node group name"
  value       = module.eks.node_group_name
}

output "ecr_repository_name" {
  description = "ECR repository name"
  value       = module.ecr.repository_name
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repository_url
}

output "ecr_repository_arn" {
  description = "ECR repository ARN"
  value       = module.ecr.repository_arn
}

output "argocd_namespace" {
  description = "ArgoCD namespace"
  value       = module.argocd.namespace
}

output "argocd_release_name" {
  description = "ArgoCD Helm release"
  value       = module.argocd.release_name
}

output "argocd_release_status" {
  description = "ArgoCD Helm release status"
  value       = module.argocd.release_status
}