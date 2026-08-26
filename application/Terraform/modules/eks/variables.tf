variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_a_id" {
  description = "Private subnet A"
  type        = string
}

variable "private_subnet_b_id" {
  description = "Private subnet B"
  type        = string
}

variable "private_subnet_c_id" {
  description = "Private subnet C"
  type        = string
}