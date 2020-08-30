variable "aws_region" {
  description = "Region to be used on all the resources creation"
  type        = string
  default     = ""
}

variable "image_name" {
  type        = string
  description = "Name of the docker image to apply."
}

variable "env_name" {
  type        = string
  description = "Name of environment"
}

variable "app_name" {
  type        = string
  description = "The name of the app in this fargate cluster."
}


variable "task_group_family" {
  type        = string
  description = "Name of task group family."
}

variable "cpu_units" {
  type        = string
  description = "CPU Units to allocate to task definition."
}

variable "ram_units" {
  type        = string
  description = "RAM units to allocate to task definition."
}

variable "execution_role_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume"
  default = ""
}

variable "task_role_arn" {
  type        = string
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
    default = ""
}

variable "capacity_provider" {
  type        = string
  description = "capacity_provider (e.g. FARGATE or FARGATE_SPOT)"
  default     = "FARGATE"
}

variable "desired_tasks" {
  type        = number
  description = "Desired number of tasks running"
  default     = 1
}

variable "maxiumum_healthy_task_percent" {
  type        = number
  description = "Maxiumum Percent of healthy tasks"
  default     = 200
}

variable "minimum_healthy_task_percent" {
  type        = number
  description = "Minimum Percentage of tasks running"
  default     = 100
}

variable "security_groups" {
  description = "The security groups to attach to the load balancer. e.g. [\"sg-edcd9784\",\"sg-edcd9785\"]"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}

variable "target_group_arn" {
  type        = string
  description = "The ARN of the Load Balancer target group to associate with the service."
}

variable "container_port" {
  type        = number
  description = "Container port for the container"
}

variable "volume_name" {
  type        = string
  description = "Volume Name."
}

variable "file_system_id" {
  type        = string
  description = "EFS File System ID"
}

variable "platform_version" {
  type        = string
  description = "The platform version on which to run your service"
}

variable "root_directory" {
  type        = string
  description = "The directory within the Amazon EFS file system to mount as the root directory inside the host"
}

variable "containerPath" {
  type        = string
  description = "The directory within the Amazon EFS file system to mount as the root directory inside the host"
}
