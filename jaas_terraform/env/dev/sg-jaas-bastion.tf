module "sg_jaas_bastion" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    create = "true"
    name = "jaas-dev-sg-jaas-bastion"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for JaaS Bastion, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "rdp-tcp"
      cidr_blocks = "45.251.35.251/32"
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