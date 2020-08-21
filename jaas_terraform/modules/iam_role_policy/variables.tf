variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "policy_path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "policy_description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
}

variable "role" {
  description = " The IAM role to attach to the policy"
  type        = string
  default     = ""
}