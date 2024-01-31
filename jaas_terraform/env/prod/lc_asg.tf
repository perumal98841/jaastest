locals {
  user_data = <<EOF
#!/bin/bash
echo "$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).fs-033f65c178c02cc6a.efs.us-east-1.amazonaws.com:/ /var/lib/jenkins nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" >> /etc/fstab
mount -a -t nfs4
sudo chown jenkins:jenkins /var/lib/jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo /tmp/agent_installer.sh install_start --token eu:e6294dfe-5848-48fa-b4e0-ebd137c1876b --attributes "Galaxy-JaaS-PROD"
EOF
}

module "jaas_lc_asg" {
    source      = "../../modules/lc_asg"
    aws_region = "us-east-1"

  name = "jaas-prod-master"

  # Launch configuration
  #
  # launch_configuration = "my-existing-launch-configuration" # Use the existing launch configuration
  # create_lc = false # disables creation of launch configuration
  lc_name = "jaas-prod-lc"

  image_id                     = "ami-0e4956e2245a7b5fd"
  # OLD Image image_id                     = "ami-0bc1a2d373fcebcdb"  
  instance_type                = "t3a.small"
#  key_name                     = module.keypair_master.this_key_pair_key_name
  key_name                     = "New-key"
  security_groups              = module.sg_jaas_master.this_security_group_id
  recreate_asg_when_lc_changes = true
  iam_instance_profile = module.jaas_iam_instance_profile.name
  user_data_base64 = base64encode(local.user_data)
  # Auto scaling group
  asg_name                  = "jaas-prod-asg"
  vpc_zone_identifier       = [module.jaas_prod_vpc.private_subnets[0],module.jaas_prod_vpc.private_subnets[1]]
  health_check_type         = "EC2"
  min_size                  = 1
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  target_group_arns = module.jaas_prod_alb.target_group_arns
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