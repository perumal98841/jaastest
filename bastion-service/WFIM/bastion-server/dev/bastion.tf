module "wfim_dev_bastion" {
    source      = "../../g-modules/ec2"

    instance_count = 1
    name          = "WFID-DEV-Bastion"
  ami           = "ami-0f1319c917f187ba6"
  instance_type = "t3a.small"
  subnet_id     = "subnet-016261286aa428875"
  private_ips                 = ["10.7.203.82"]
  vpc_security_group_ids      =   module.sg_wfim_bastion_dev.this_security_group_id
  associate_public_ip_address = false
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