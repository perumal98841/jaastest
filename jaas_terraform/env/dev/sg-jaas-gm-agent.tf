module "sg_gm-agent" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-dev-sg-gm-agent"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for Grand Master Jenkins Agent, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "45.251.35.168/32"
    },    
    {
      rule        = "ssh-tcp"
      cidr_blocks = "45.251.35.168/32"
    },
  ]
    egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "dev"
        Product = "GM-Agent"
        Terraform = "True"
    }
}