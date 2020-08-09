module "lc_jaas_master" {
    source      = "../../modules/launchconfiguration"
    aws_region = "us-east-1"
    name                = "jaas-dev-lc-jaas-master"
    vpc_id              = module.jaas_dev_vpc.vpc_id
    image_id            = "ami-0e942c59119284089"
    instance_type       = "t3a.small"
    key_name            = module.master_key_pair.this_key_pair_key_pair_id
    security_groups     = module.sg_jaas_master.this_security_group_id
}