module "sg_jaas_bastion_dev" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    create = "false"    
    name = "jaas-dev-sg-jaas-bastion-dev"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for JaaS Bastion, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "rdp-tcp"
      cidr_blocks = "10.3.138.192/27,10.3.138.32/27"
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
        Product = "JaaS-Bastion"
        Terraform = "True"
    }
}