module "lc_jaas_master" {
    source      = "../../modules/launchconfiguration"
    aws_region = "us-east-1"
    name                = "jaas-dev-lc-jaas-master"
    vpc_id              = module.jaas_dev_vpc.vpc_id
    image_id            = "ami-0e942c59119284089"
    instance_type       = "t3a.small"
    key_name            = module.master_key_pair.id
    security_groups     = module.sg_jaas_master.id

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