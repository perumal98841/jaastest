module "jaas_prod_sg" {
    source      = "../../modules/securitygroup"
    aws_region = "us-east-1"
    name = "jaas-prod-sg"
    vpc_id = module.jaas_prod_vpc.vpc_id
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