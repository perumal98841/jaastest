module "dev_vpc" {
    source      = "../../modules/vpc"
    vpc_cidr    = "10.8.24.0/24"
    subnet_cidr = "10.8.24.0/28"
    vpc_id      = "${modules.vpc.vpc_id}"
}


