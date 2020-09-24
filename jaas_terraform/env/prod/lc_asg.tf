locals {
  user_data = <<EOF
#!/bin/bash
echo "$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).fs-dd489c5f.efs.us-east-1.amazonaws.com:/ /efs-volume nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" >> /etc/fstab
mount -a -t nfs4
echo $(aws ecr get-authorization-token --region us-east-1 --output text --query 'authorizationData[].authorizationToken' | base64 -d | cut -d: -f2) | docker login -u AWS 187945997467.dkr.ecr.us-east-1.amazonaws.com --password-stdin
docker pull 187945997467.dkr.ecr.us-east-1.amazonaws.com/jaas-dev:jaas-v1.3
docker run -itd -p 80:8080 -p 50000:50000 -v /efs-volume/jaas:/var/jenkins_home 187945997467.dkr.ecr.us-east-1.amazonaws.com/jaas-dev:jaas-v1.3
/opt/nessus_agent/sbin/nessuscli agent link --host=cloud.tenable.com --port=443 --key=bbdb8add4bb0e8f8491c356ab0758ea8eb52c88d9c1102fa72166a83bb7a2ac6 --groups=JaaS-DEV,AWS,HIDG 
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

  image_id                     = "ami-045641ada9f1b5a4e"
  instance_type                = "t3a.small"
  key_name                     = module.keypair_master.this_key_pair_key_name
  security_groups              = module.sg_jaas_master.this_security_group_id
  recreate_asg_when_lc_changes = true
  iam_instance_profile = module.jaas_iam_instance_profile.name
  user_data_base64 = base64encode(local.user_data)
  # Auto scaling group
  asg_name                  = "jaas-prod-asg"
  vpc_zone_identifier       = [module.jaas_prod_vpc.private_subnets[0],module.jaas_prod_vpc.private_subnets[1]]
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 0
  desired_capacity          = 0
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