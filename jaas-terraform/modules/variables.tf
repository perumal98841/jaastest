  variable "tags" {
      description   =   "A Map of tags to add to all resources"
      type          =   map(string)
      default       =   {}

  }

    variable "vpc_tags" {
      description   =   "Additional tags for the VPC"
      type          =   map(string)
      default       =   {}

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