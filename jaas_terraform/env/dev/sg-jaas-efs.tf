data "aws_security_group" "master-jenkins" {
  name   = module.sg_jaas_master.this_security_group_name[0]
  vpc_id = module.jaas_dev_vpc.vpc_id
}

module "sg_jaas_efs" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-dev-sg-jaas-efs"
    vpc_id = module.jaas_dev_vpc.vpc_id
    description = "Security Group for EFS, managed by Terraform"
    ingress_with_source_security_group_id = [
    {
      from_port                = 2049
      to_port                  = 2049
      protocol                 = 6
      description              = "Service name"
      source_security_group_id = data.aws_security_group.master-jenkins.id
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