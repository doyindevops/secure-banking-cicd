variable "vpc_id" {
  description = "VPC where the security group will be created"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}
