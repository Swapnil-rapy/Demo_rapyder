output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}


output "public_subnet_a_id" {
  description = "Public subnet A ID"
  value       = module.vpc.public_subnet_a_id
}


output "public_subnet_b_id" {
  description = "Public subnet B ID"
  value       = module.vpc.public_subnet_b_id
}


output "public_subnet_c_id" {
  description = "Public subnet C ID"
  value       = module.vpc.public_subnet_c_id
}


output "private_subnet_a_id" {
  description = "Private subnet A ID"
  value       = module.vpc.private_subnet_a_id
}


output "private_subnet_b_id" {
  description = "Private subnet B ID"
  value       = module.vpc.private_subnet_b_id
}


output "private_subnet_c_id" {
  description = "Private subnet C ID"
  value       = module.vpc.private_subnet_c_id
}


output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}


output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
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