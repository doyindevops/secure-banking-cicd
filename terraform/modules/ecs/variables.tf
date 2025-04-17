variable "project" {
  description = "Project name for resource tagging"
  type        = string
}

variable "container_image" {
  description = "Docker image to deploy"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}

variable "subnet_ids" {
  description = "Subnet IDs for service placement"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the ECS service"
  type        = list(string)
}

variable "execution_role_arn" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}

variable "assign_public_ip" {
  description = "Should the ECS task get a public IP"
  type        = bool
  default     = false
}
