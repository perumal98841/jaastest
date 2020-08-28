data "aws_security_group" "bastionserver" {
  name   = module.sg_jaas_bastion.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}


module "sg-gm-agent" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-dev-sg-gm-agent"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for Grand Master Jenkins Agent, managed by Terraform"

    ingress_rules = [
      from_port = 9090
      to_port = 9090
      protocol = 6
      description = "Portainer"
    ]
    ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "45.251.35.251/32"
    },    
    {
      rule        = "ssh-tcp"
      cidr_blocks = "45.251.35.251/32"
    },
  ]

   ingress_with_source_security_group_id = [
    {
      from_port                = 80
      to_port                  = 80
      protocol                 = 6
      description              = "HTTP"
      source_security_group_id = data.aws_security_group.bastionserver.id
    },
    {
      from_port                = 443
      to_port                  = 443
      protocol                 = 6
      description              = "HTTPS"
      source_security_group_id = data.aws_security_group.bastionserver.id
    },
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = 6
      description              = "SSH"
      source_security_group_id = data.aws_security_group.bastionserver.id
    },
    {
      from_port                = 9090
      to_port                  = 9090
      protocol                 = 6
      description              = "Portainer"
      source_security_group_id = data.aws_security_group.bastionserver.id
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