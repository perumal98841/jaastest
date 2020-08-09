provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "nat" {
  count = 2
}
module "jaas_prod_vpc" {
    source      = "../../modules/vpc"
    aws_region = "us-east-1"
    name = "jaas-prod"
    vpcname ="jaas-prod-vpc"
    cidr    = "10.8.25.0/24"
    azs = ["us-east-1a","us-east-1b"]
    public_subnets = ["10.8.25.0/28","10.8.25.16/28"]
    private_subnets = ["10.8.25.32/28","10.8.25.48/28","10.8.25.96/27","10.8.25.128/27","10.8.25.160/28","10.8.25.176/28"]

    enable_nat_gateway = true
    single_nat_gateway = false
    one_nat_gateway_per_az = true
    reuse_nat_ips = true
    external_nat_ip_ids = "${aws_eip.nat.*.id}"    
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "prod"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}


