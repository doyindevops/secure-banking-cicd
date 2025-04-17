provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source             = "../../modules/vpc"
  project            = "securebanking-prod"
  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
  enable_nat_gateway = false
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
  project             = "securebanking-prod"
  container_image     = "adedoyine/securebanking-app:latest"
  container_port      = 8080
  subnet_ids          = module.vpc.public_subnet_ids
  assign_public_ip    = true
  security_group_ids  = [module.security.security_group_id]
  execution_role_arn  = module.iam.ecs_execution_role_arn
}


