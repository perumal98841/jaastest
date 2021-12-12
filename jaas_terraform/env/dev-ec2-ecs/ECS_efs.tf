module "ECS_jaas_efs" {
    source      = "../../modules/efs"
  name               = "ECS-JaaS-EFS"
  aws_region             = "us-east-1"
  vpc_id             = module.jaas_dev_vpc.vpc_id
  subnets            = [module.jaas_dev_vpc.private_subnets[2],module.jaas_dev_vpc.private_subnets[3]]
  security_groups    = module.sg_jaas_efs.this_security_group_id

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