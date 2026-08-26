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


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}


variable "availability_zone_a" {
  description = "First Availability Zone"
  type        = string
  default     = "ap-south-1a"
}


variable "availability_zone_b" {
  description = "Second Availability Zone"
  type        = string
  default     = "ap-south-1b"
}


variable "availability_zone_c" {
  description = "Third Availability Zone"
  type        = string
  default     = "ap-south-1c"
}


variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "sample-eks"
}


variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.33"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "sample-app"
}


