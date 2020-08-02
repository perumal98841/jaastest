resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tenancy

   tags = merge(
    {
      "Name" = format("%s", var.vpcname)
    },
    var.business_tags,
    var.technical_tags,
  )
}

resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr

  tags = merge(
    {
      "Name" = format("%s", var.subnetname)
    },
    var.business_tags,
    var.technical_tags,
  )
}