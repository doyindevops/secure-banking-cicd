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
  description = "Security groups to attach to the task"
  type        = list(string)
}

variable "execution_role_arn" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}
