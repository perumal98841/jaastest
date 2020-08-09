module "jaas_dev_sg" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-dev-sg"
    vpc_id = module.jaas_dev_vpc.vpc_id
    
    # Open for all Ingress CIDR Block
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["https-443-tcp"]

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