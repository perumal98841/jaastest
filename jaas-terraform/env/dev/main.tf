module "dev_vpc" {
    source      = "../../modules/vpc"
    vpc_cidr    = "10.8.24.0/24"
    subnet_cidr = "10.8.24.0/28"
    vpc_id      = "${module.dev_vpc.vpc_id}"
    aws_region = "us-east-1"
    name = "DEV-VPC"
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "dev"
        Product = "Jenkins-as-a-Service"
    }
}


