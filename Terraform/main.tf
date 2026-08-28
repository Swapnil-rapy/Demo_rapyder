/* 
module "vpc" {
  source = "./modules/vpc"

  name = var.vpc_name

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  tags = var.tags
} 
*/

module "vpc" {
  source = "./modules/vpc"

  for_each = var.vpcs

  vpc_name             = each.key
  vpc_cidr             = each.value.cidr
  public_subnet_cidrs  = each.value.public_subnets
  private_subnet_cidrs = each.value.private_subnets
  availability_zones = each.value.availability_zones
  
}


module "eks" {
  source = "./modules/eks"

  cluster_name = var.eks_cluster_name

  kubernetes_version = var.kubernetes_version

  vpc_id = module.vpc["sample"].vpc_id

  subnet_ids = module.vpc["sample"].private_subnet_ids

}


module "ecr" {
  source = "./modules/ecr"

  repository_name = var.ecr_repository_name
}


module "argocd" {
  source = "./modules/argocd"

  namespace     = "argocd"
  chart_version = "9.1.6"
}

