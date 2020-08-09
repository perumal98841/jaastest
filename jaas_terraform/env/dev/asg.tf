module "master_asg" {
    source      = "../../modules/asg"

    create_lc   =   false
    launch_configuration    =   module.lc_jaas_master.lc_id
    name        =   "jaas-dev"
    asg_name    =   "jaas-dev-asg"
    vpc_zone_identifier =  module.jaas_dev_vpc.private_subnets

    health_check_type         = "EC2"
    min_size                  = 1
    max_size                  = 1
    desired_capacity          = 1
    wait_for_capacity_timeout = 0


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
