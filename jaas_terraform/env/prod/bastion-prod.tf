module "jaas_prod_bastion_prod" {
    source      = "../../modules/ec2"

    instance_count = 1
    name          = "JaaS-PROD-Bastion"
  ami           = "ami-02404348e17201e00"
  instance_type = "t3a.small"
  subnet_id     = tolist(module.jaas_prod_vpc.private_subnets)[1]
  private_ips                 = ["10.3.168.62"]
  user_data_base64 = "PHNjcmlwdD4KbXNpZXhlYyAvaSBjOlxOZXNzdXNBZ2VudFxOZXNzdXNBZ2VudC5tc2kgTkVTU1VTX0dST1VQUz0iSmFhUy1QUk9ELEFXUyxISURHIiBORVNTVVNfU0VSVkVSPSJjbG91ZC50ZW5hYmxlLmNvbTo0NDMiIE5FU1NVU19LRVk9YmJkYjhhZGQ0YmIwZThmODQ5MWMzNTZhYjA3NThlYThlYjUyYzg4ZDljMTEwMmZhNzIxNjZhODNiYjdhMmFjNiAvcW4KPC9zY3JpcHQ+"
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