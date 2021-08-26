data "aws_security_group" "master_jenkins" {
  name   = module.sg_jaas_master.this_security_group_name[0]
  vpc_id = module.jaas_prod_vpc.vpc_id
}

module "sg_jaas_efs" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-prod-sg-jaas-efs"
    vpc_id = module.jaas_prod_vpc.vpc_id
    description = "Security Group for EFS, managed by Terraform"
    ingress_with_source_security_group_id = [
    {
      from_port                = 2049
      to_port                  = 2049
      protocol                 = 6
      description              = "EFS for Jenkins Master Node"
      source_security_group_id = data.aws_security_group.master_jenkins.id
    },
  ]
    egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "10.8.25.0/24"
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