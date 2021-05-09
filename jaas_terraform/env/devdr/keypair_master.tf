module "keypair_master" {
    source      = "../../modules/keypair"

  key_name   = "jaas-dev-master-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAk18WOmWfA+kXDqW79L7cWApIETQBOPeKSX3Wr794KByFsiRfP/BcU0O4xqiw4nv+XsuPbXROHy7+ti6o5VqWo1M7+HEDLq7QPdJGlBoQosmLwMCufu0IZxGMTqDqa45HZrfYaq1bpvkGOD6UQV3NWAVVLloV2Lb5c3vReAK4VINHIl3NnAEK9kOpR4beP7DGjuPPe4Wq+kHKEWbpBn2gJpV6+pB4Kxvn9LBjqjpmw5P0eoE85Gtt7q7yDFTFIvNgGe5oqjRYbWPB/S1PkDGRthK8lPLgr5FD+pnPdrqp/Rfnw0mBNhGeFe+QQBxaqFOcZ5wlftU/SDz2eladPlxl6Q=="
    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "devdr"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}