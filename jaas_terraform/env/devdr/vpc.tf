provider "aws" {
  region = "eu-west-1"
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
    aws_region = "eu-west-1"
    name = "jaas-dev"
    vpcname ="jaas-dev-vpc"
    cidr    = "10.8.26.0/24"
    enable_dns_hostnames             = true
    enable_dns_support               = true
    azs = ["eu-west-1a","eu-west-1b"]
    public_subnets = ["10.8.26.0/28","10.8.26.16/28"]
    private_subnets = ["10.8.26.32/28","10.8.26.48/28","10.8.26.96/27","10.8.26.128/27","10.8.26.160/28","10.8.26.176/28"]

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
        Env = "devdr"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}