module "sg_jaas_master" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-dev-sg-jaas-master"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for Jenkins-as-a-Service, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "10.3.138.192/27,10.3.138.32/27,10.8.24.0/28,10.8.24.16/28"
    },
  ]

    ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.sg_jaas_alb.this_security_group_id
    },
    {
      rule                     = "http-443-tcp"
      source_security_group_id = module.sg_jaas_alb.this_security_group_id
    },
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.sg_jaas_bastion.this_security_group_id
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
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}