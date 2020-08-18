module "jaas_dev_bastion" {
    source      = "../../modules/ec2"

    instance_count = 1
    name          = "JaaS-DEV-Bastionsssss"
  ami           = ami-0f1319c917f187ba6
  instance_type = "t3a.small"
  subnet_id     = [module.jaas_dev_vpc.private_subnets[0],module.jaas_dev_vpc.private_subnets[1]]
  private_ips                 = ["10.8.24.14", "10.8.24.30"]
  vpc_security_group_ids      =   module.sg_jaas_bastion.this_security_group_id
  associate_public_ip_address = true
}