variable "vpc_cidr" {
    default = ""
}

variable "vpc_tenancy" {
    default = "default"
}

variable "vpc_id" {}

variable "subnet_cidr" {}

variable "aws_region" {
    type = string
}

variable "name" {}

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