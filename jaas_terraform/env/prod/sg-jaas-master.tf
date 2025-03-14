data "aws_security_group" "alb" {
  name   = module.sg_jaas_alb.this_security_group_name[0]
  vpc_id = module.jaas_prod_vpc.vpc_id
}

data "aws_security_group" "bastion" {
  name   = module.sg_jaas_bastion_prod.this_security_group_name[0]
  vpc_id = module.jaas_prod_vpc.vpc_id
}

module "sg_jaas_master" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-prod-sg-jaas-master"
    vpc_id = module.jaas_prod_vpc.vpc_id
    description = "Security Group for Jenkins-as-a-Service, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "10.3.138.192/27,10.3.138.32/27,10.3.168.0/28,10.3.168.16/28"
    },
  ]

      ingress_with_source_security_group_id = [
    {
      from_port                = 80
      to_port                  = 80
      protocol                 = 6
      description              = "HTTP for ALB"
      source_security_group_id = data.aws_security_group.alb.id
    },
    {
      from_port                = 443
      to_port                  = 443
      protocol                 = 6
      description              = "HTTPS for ALB"
      source_security_group_id = data.aws_security_group.alb.id
    },
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = 6
      description              = "SSH for Bastion host"
      source_security_group_id = data.aws_security_group.bastion.id
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
        Env = "prod"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}