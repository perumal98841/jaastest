module "dev_vpc" {
    source      = "../../modules/vpc"
    aws_region = "us-east-1"
    name = "jaas-dev"
    vpcname ="jaas-dev-vpc"
    cidr    = "10.8.24.0/24"
    azs = ["us-east-1","us-east-2"]
    public_subnets = ["10.8.24.0/28","10.8.24.16/28"]
    private_subnets = ["10.8.24.32/28","10.8.24.48/28","10.8.24.96/27","10.8.24.128/27","10.8.24.160/28","10.8.24.176/28"]

    enable_nat_gateway = true
    single_nat_gateway = true
    
    igwname = "IGW"
    public_subnet_name = "PUBLIC"
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "DEV"
        Product = "Jenkins-as-a-Service"
    }
}


