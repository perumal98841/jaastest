module "dev_vpc" {
    source      = "../../modules/vpc"
    vpc_cidr    = "10.8.25.0/24"
    subnet_cidr = "10.8.25.0/28"
    vpc_id      = "${module.dev_vpc.vpc_id}"
    aws_region = "us-east-1"
}


