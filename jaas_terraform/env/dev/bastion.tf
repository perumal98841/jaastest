module "jaas_dev_bastion" {
    source      = "../../modules/ec2"

    instance_count = 0
    name          = "perumal-JaaS-DEV-Bastion"
  ami           = "ami-02404348e17201e00"
  instance_type = "t3a.xlarge"
  subnet_id     = tolist(module.jaas_dev_vpc.public_subnets)[0]
  private_ips                 = ["10.3.170.14"]
  vpc_security_group_ids      =   module.sg_jaas_bastion.this_security_group_id
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