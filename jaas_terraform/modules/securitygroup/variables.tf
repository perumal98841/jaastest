variable "aws_region" {
  description = "Region to be used on all the resources creation"
  type        = string
  default     = ""
}

variable "create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}

variable "use_name_prefix" {
  description = "Whether to use name_prefix or fixed name. Should be true to able to update security group name after initial creation"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of security group"
  type        = string
}

variable "description" {
  description = "Description of security group"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. Enable for EMR."
  type        = bool
  default     = false
}

variable "business_tags" {
    description   =   "Additional tags for the VPC"
    type          =   map(string)
    default       =   {}
}
variable "technical_tags" {
    description   =   "Additional tags for the VPC"
    type          =   map(string)
    default       =   {}
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type        = list(string)
  default     = []
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_rules" {
  description = "List of egress rules to create by name"
  type        = list(string)
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}