

module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  az_a = var.availability_zone_a

  az_b = var.availability_zone_b

  az_c = var.availability_zone_c
}


module "eks" {
  source = "./modules/eks"

  cluster_name = var.eks_cluster_name

  kubernetes_version = var.kubernetes_version

  vpc_id = module.vpc.vpc_id

  private_subnet_a_id = module.vpc.private_subnet_a_id

  private_subnet_b_id = module.vpc.private_subnet_b_id

  private_subnet_c_id = module.vpc.private_subnet_c_id
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