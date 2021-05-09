data "aws_security_group" "master_windows" {
  name   = module.sg_jaas_master.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}

data "aws_security_group" "bastion_windows" {
  name   = module.sg_jaas_bastion_dev.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}

module "sg_jaas_agent_windows" {
    source      = "../../modules/securitygroup"
    aws_region = "eu-west-1"
    name = "jaas-dev-sg-jaas-agent-windows"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for Windows Agent, managed by Terraform"
    ingress_with_source_security_group_id = [
    {
      from_port                = 445
      to_port                  = 445
      protocol                 = 6
      description              = "Jenkins-Windows-Agent"
      source_security_group_id = data.aws_security_group.master_windows.id
    },
    {
      from_port                = 50000
      to_port                  = 50000
      protocol                 = 6
      description              = "JNLP"
      source_security_group_id = data.aws_security_group.master_windows.id
    },
    {
      from_port                = 5985
      to_port                  = 5985
      protocol                 = 6
      description              = "Jenkins-Windows-Agent"
      source_security_group_id = data.aws_security_group.master_windows.id
    },    
    {
      from_port                = 5986
      to_port                  = 5986
      protocol                 = 6
      description              = "Jenkins-Windows-Agent"
      source_security_group_id = data.aws_security_group.master_windows.id
    },    

    {
      from_port                = 3389
      to_port                  = 3389
      protocol                 = 6
      description              = "RDP"
      source_security_group_id = data.aws_security_group.bastion_windows.id
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