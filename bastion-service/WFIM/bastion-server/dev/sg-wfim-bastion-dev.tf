module "sg_wfim_bastion_dev" {
    source      = "../../g-modules/securitygroup"
    aws_region = "us-east-1"
    name = "iams-wfim-dev-bastion"
    vpc_id = "vpc-01d3ddb16db04055b"
    description = "Security Group for Bastion, managed by Terraform"
    ingress_with_cidr_blocks = [
    {
      rule        = "rdp-tcp"
      cidr_blocks = "10.3.138.192/27,10.3.138.32/27,10.3.132.110/32,10.3.138.32/27"
    },
  ]
    egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
    business_tags = {
        BU = "IAMS"
        CostCenter = "111010031070440061161"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "dev"
        Product = "WorkforceID-Bastion"
        PublicAccess = "No"
        SLA = "99.99"
        Automation = "Yes - Terraform"
    }
}