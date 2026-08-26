variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "az_a" {
  description = "Availability Zone A"
  type        = string
}

variable "az_b" {
  description = "Availability Zone B"
  type        = string
}

variable "az_c" {
  description = "Availability Zone C"
  type        = string
}