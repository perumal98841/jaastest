module "jaas_lc_asg" {
    source      = "../../modules/lc_asg"
    aws_region = "us-east-1"

  name = "example-with-ec2"

  # Launch configuration
  #
  # launch_configuration = "my-existing-launch-configuration" # Use the existing launch configuration
  # create_lc = false # disables creation of launch configuration
  lc_name = "example-lc"

  image_id                     = ami-0e942c59119284089
  instance_type                = "t3a.small"
  security_groups              = module.sg_jaas_master.this_security_group_id
  recreate_asg_when_lc_changes = true

  # Auto scaling group
  asg_name                  = "example-asg"
  vpc_zone_identifier       = module.jaas_dev_vpc.private_subnets
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 0
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