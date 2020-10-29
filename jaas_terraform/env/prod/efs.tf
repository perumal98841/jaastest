module "jaas_efs" {
    source      = "../../modules/efs"
  name               = "JaaS-EFS"
  aws_region             = "us-east-1"
  vpc_id             = module.jaas_prod_vpc.vpc_id
  subnets            = [module.jaas_prod_vpc.private_subnets[0],module.jaas_prod_vpc.private_subnets[1]]
  security_groups    = module.sg_jaas_efs.this_security_group_id
  encrypted = "true"
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "prod"
        Product = "JaaS-Bastion"
        Terraform = "True"
    }  
}