
variable "aws_region" {
  description = "Region to be used on all the resources creation"
  type        = string
  default     = ""
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

variable "encrypted" {
  type        = bool
  description = "If true, the file system will be encrypted"
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "If set, use a specific KMS key"
  default     = null
}

variable "performance_mode" {
  type        = string
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`"
  default     = "generalPurpose"
}

variable "provisioned_throughput_in_mibps" {
  default     = 0
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with `throughput_mode` set to provisioned"
}

variable "throughput_mode" {
  type        = string
  description = "Throughput mode for the file system. Defaults to bursting. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`"
  default     = "bursting"
}

variable "transition_to_ia" {
  type        = string
  description = "Indicates how long it takes to transition files to the IA storage class. Valid values: AFTER_7_DAYS, AFTER_14_DAYS, AFTER_30_DAYS, AFTER_60_DAYS and AFTER_90_DAYS"
  default     = ""
}

variable "subnets" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "mount_target_ip_address" {
  type        = string
  description = "The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target"
  default     = ""
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
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