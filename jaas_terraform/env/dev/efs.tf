module "jaas_efs" {
    source      = "../../modules/efs"

  namespace          = "jaas-efs"
  name               = "JaaS-EFS"
  region             = "us-east-1"
  vpc_id             = module.jaas_dev_vpc.vpc_id
  subnets            = tolist(module.jaas_dev_vpc.private_subnets)[0]
  security_groups    = module.sg_jaas_efs.this_security_group_id
}