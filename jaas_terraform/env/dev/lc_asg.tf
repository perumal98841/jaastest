module "jaas_lc_asg" {
    source      = "../../modules/lc_asg"
    aws_region = "us-east-1"

  name = "jaas-dev-master"

  # Launch configuration
  #
  # launch_configuration = "my-existing-launch-configuration" # Use the existing launch configuration
  # create_lc = false # disables creation of launch configuration
  lc_name = "jaas-dev-lc"

  image_id                     = "ami-0899f586195b11fa9"
  instance_type                = "t3a.small"
  key_name                     = module.keypair_master.this_key_pair_key_name
  security_groups              = module.sg_jaas_master.this_security_group_id
  recreate_asg_when_lc_changes = true

  # Auto scaling group
  asg_name                  = "jaas-dev-asg"
  vpc_zone_identifier       = [module.jaas_dev_vpc.private_subnets[0],module.jaas_dev_vpc.private_subnets[1]]
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