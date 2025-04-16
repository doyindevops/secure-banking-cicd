provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source             = "../../modules/vpc"
  project            = var.project
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  enable_nat_gateway = false  # ✅ Cost control for dev
}

# IAM - ECS Execution Role
module "iam" {
  source  = "../../modules/iam"
  project = var.project
}

# Security Group for ECS
module "security" {
  source  = "../../modules/security"
  vpc_id  = module.vpc.vpc_id
  project = var.project
}

# ECS Fargate Service
module "ecs" {
  source              = "../../modules/ecs"
  project             = var.project
  container_image     = "nginx:latest"
  container_port      = 8080
  subnet_ids          = module.vpc.private_subnet_ids
  security_group_ids  = [module.security.security_group_id]
  execution_role_arn  = module.iam.ecs_execution_role_arn   # ✅ Correct input
}

