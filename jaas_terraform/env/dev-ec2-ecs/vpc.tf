provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "nat" {
  count = 1
   tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
        Env = "prod"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }  
}
module "jaas_dev_vpc" {
    source      = "../../modules/vpc"
    aws_region = "us-east-1"
    name = "jaas-dev"
    vpcname ="jaas-dev-vpc"
    cidr    = "10.8.24.0/24"
    enable_dns_hostnames             = true
    enable_dns_support               = true
    azs = ["us-east-1a","us-east-1b"]
    public_subnets = ["10.8.24.0/28","10.8.24.16/28"]
    private_subnets = ["10.8.24.32/28","10.8.24.48/28","10.8.24.96/27","10.8.24.128/27","10.8.24.160/28","10.8.24.176/28"]

    enable_nat_gateway = true
    single_nat_gateway = true
    one_nat_gateway_per_az = false
    reuse_nat_ips = true
    external_nat_ip_ids = "${aws_eip.nat.*.id}"
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "dev"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}