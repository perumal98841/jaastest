variable "vpc_cidr" {
    default = ""
}

variable "vpc_tenancy" {
    default = "default"
}

variable "vpc_id" {}

variable "subnet_cidr" {}

variable "aws_region" {
    type = "string"
}
