data "aws_security_group" "master" {
  name   = module.sg_jaas_master.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}

data "aws_security_group" "bastionagent" {
  name   = module.sg_jaas_bastion.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}


module "sg_jaas_agent" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-dev-sg-jaas-agent"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for Jenkins-as-a-Service, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "rdp-tcp"
      cidr_blocks = "10.3.138.192/27,10.3.138.32/27"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = "10.3.138.192/27,10.3.138.32/27"
    },
  ]

      ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = 6
      description              = "SSH"
      source_security_group_id = data.aws_security_group.master.id
    },
    {
      from_port                = 50000
      to_port                  = 50000
      protocol                 = 6
      description              = "JNLP"
      source_security_group_id = data.aws_security_group.master.id
    },
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = 6
      description              = "SSH"
      source_security_group_id = data.aws_security_group.bastionagent.id
    },    
    {
      from_port                = 3389
      to_port                  = 3389
      protocol                 = 6
      description              = "RDP"
      source_security_group_id = data.aws_security_group.bastionagent.id
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