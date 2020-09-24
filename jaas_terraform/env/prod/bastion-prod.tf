module "jaas_prod_bastion_prod" {
    source      = "../../modules/ec2"

    instance_count = 1
    name          = "JaaS-PROD-Bastion"
  ami           = "ami-0f1319c917f187ba6"
  instance_type = "t3a.small"
  subnet_id     = tolist(module.jaas_prod_vpc.private_subnets)[1]
  private_ips                 = ["10.8.24.62"]
  vpc_security_group_ids      =   module.sg_jaas_bastion_prod.this_security_group_id
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "prod"
        Product = "JaaS-Bastion"
        Terraform = "True"
    }  
    
}