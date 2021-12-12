module "jaas_dev_bastion_dev" {
    source      = "../../modules/ec2"

    instance_count = 1
    name          = "JaaS-DEV-Bastion"
  ami           = "ami-02404348e17201e00"
  instance_type = "t3a.small"
  subnet_id     = tolist(module.jaas_dev_vpc.private_subnets)[1]
  private_ips                 = ["10.8.24.62"]
  user_data_base64 = "PHNjcmlwdD4KbXNpZXhlYyAvaSBjOlxOZXNzdXNBZ2VudFxOZXNzdXNBZ2VudC5tc2kgTkVTU1VTX0dST1VQUz0iSmFhUy1ERVYsQVdTLEhJREciIE5FU1NVU19TRVJWRVI9ImNsb3VkLnRlbmFibGUuY29tOjQ0MyIgTkVTU1VTX0tFWT1iYmRiOGFkZDRiYjBlOGY4NDkxYzM1NmFiMDc1OGVhOGViNTJjODhkOWMxMTAyZmE3MjE2NmE4M2JiN2EyYWM2IC9xbgo8L3NjcmlwdD4="  
  vpc_security_group_ids      =   module.sg_jaas_bastion_dev.this_security_group_id
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