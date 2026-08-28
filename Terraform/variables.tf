variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}


variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "sample-project"
}


variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

/*
variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDRs"
}
*/

variable "vpcs" {
  type = map(object({
    cidr            = string
    public_subnets  = list(string)
    private_subnets = list(string)
    availability_zones = list(string)
  }))
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags"
  default     = {}
}


variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "sample-eks"
}


variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.35"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "sample-app"
}


