module "keypair_master" {
    source      = "../../modules/keypair"

  key_name   = "jaas-prod-master-key"
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAk18WOmWfA+kXDqW79L7cWApIETQBOPeKSX3Wr794KByFsiRfP/BcU0O4xqiw4nv+XsuPbXROHy7+ti6o5VqWo1M7+HEDLq7QPdJGlBoQosmLwMCufu0IZxGMTqDqa45HZrfYaq1bpvkGOD6UQV3NWAVVLloV2Lb5c3vReAK4VINHIl3NnAEK9kOpR4beP7DGjuPPe4Wq+kHKEWbpBn2gJpV6+pB4Kxvn9LBjqjpmw5P0eoE85Gtt7q7yDFTFIvNgGe5oqjRYbWPB/S1PkDGRthK8lPLgr5FD+pnPdrqp/Rfnw0mBNhGeFe+QQBxaqFOcZ5wlftU/SDz2eladPlxl6Q=="
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSP2JQ48cPBQQ8VEkjpFFxlDdblqEwDeO2SWbKcSCImkhwBROn2rrbyC3YIB9n/yS8x8E20yE3FXQbryanonIRvqIdiHpHxSn4cAk63jBCw7Zq/L9Ptyo0yJ7KhZe0j7NOGcuW9vrRHVmdAa6wyvQy9fhoxpridPZYFbksmxuBWrKtRm5gwtbf7Ts+IYUyy4RHgVO9n/w0I8z2Bc2d949LKsR+6Ga/4vAbdO2IYrLF2JGHtZT0vPNzhMcoAP1Vfsupb7JYF9M6+srijuCau9xbIRado+nYxotwCc2EVaBgGjmPhcT8P7HbStw0oJuYj8JML+eHN540NpPbyxcE1qGH"
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "prod"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}