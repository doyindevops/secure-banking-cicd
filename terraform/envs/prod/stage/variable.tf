variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
}

variable "project" {
  description = "Prefix for resource naming"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDRs for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of AZs to use"
  type        = list(string)
}
