variable "create_role" {
  description = "Whether to create a role"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = ""
}

variable "role_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = 3600
}

variable "role_description" {
  description = "IAM Role description"
  type        = string
  default     = ""
}

variable "force_detach_policies" {
  description = "Whether policies should be detached from this role when destroying"
  type        = bool
  default     = false
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = ""
}

variable "assume_role_policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
}

