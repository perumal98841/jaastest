module "sg_jaas_alb" {
    source      = "../../modules/securitygroup"
    aws_region = "eu-west-1"
    name = "jaas-dev-sg-jaas-alb"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for Jenkins-as-a-Service, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "10.0.0.0/8"
    },
    {
      rule        = "https-443-tcp"
      cidr_blocks = "10.0.0.0/8"
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
        Env = "devdr"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}