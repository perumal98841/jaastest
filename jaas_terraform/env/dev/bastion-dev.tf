module "jaas_dev_bastion_dev" {
    source      = "../../modules/ec2"

    instance_count = 1
    name          = "JaaS-DEV-Bastion"
  ami           = "ami-0f1319c917f187ba6"
  instance_type = "t3a.small"
  subnet_id     = tolist(module.jaas_dev_vpc.private_subnets)[1]
  private_ips                 = ["10.8.24.62"]
  vpc_security_group_ids      =   module.sg_jaas_bastion_dev.this_security_group_id
  associate_public_ip_address = true
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "dev"
        Product = "JaaS-Bastion"
        Terraform = "True"
    }  
    
}