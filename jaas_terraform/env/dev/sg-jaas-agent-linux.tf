data "aws_security_group" "master_linux" {
  name   = module.sg_jaas_master.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}

data "aws_security_group" "bastion_linux" {
  name   = module.sg_jaas_bastion.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}

data "aws_security_group" "bastion_dev_linux" {
  name   = module.sg_jaas_bastion_dev.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}

module "sg_jaas_agent_linux" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-dev-sg-jaas-agent-linux"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for Linux Agent, managed by Terraform"
    ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = 6
      description              = "SSH"
      source_security_group_id = data.aws_security_group.master_linux.id
    },
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = 6
      description              = "SSH"
      source_security_group_id = data.aws_security_group.bastion_linux.id
    },
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = 6
      description              = "SSH"
      source_security_group_id = data.aws_security_group.bastion_dev_linux.id
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