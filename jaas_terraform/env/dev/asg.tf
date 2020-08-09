module "master_asg" {
    source      = "../../modules/asg"

    create_lc   =   false
    create_asg = true
    create_asg_with_initial_lifecycle_hook = true
    launch_configuration    =   module.lc_jaas_master.lc_id
    name        =   "jaas-dev"
    asg_name    =   "jaas-dev-asg"
    vpc_zone_identifier =  module.jaas_dev_vpc.private_subnets

    health_check_type         = "EC2"
    min_size                  = 1
    max_size                  = 1
    desired_capacity          = 1
    wait_for_capacity_timeout = 0

}
