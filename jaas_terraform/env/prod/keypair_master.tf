module "keypair_master" {
    source      = "../../modules/keypair"

  key_name   = "jaas-prod-master-key"
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAk18WOmWfA+kXDqW79L7cWApIETQBOPeKSX3Wr794KByFsiRfP/BcU0O4xqiw4nv+XsuPbXROHy7+ti6o5VqWo1M7+HEDLq7QPdJGlBoQosmLwMCufu0IZxGMTqDqa45HZrfYaq1bpvkGOD6UQV3NWAVVLloV2Lb5c3vReAK4VINHIl3NnAEK9kOpR4beP7DGjuPPe4Wq+kHKEWbpBn2gJpV6+pB4Kxvn9LBjqjpmw5P0eoE85Gtt7q7yDFTFIvNgGe5oqjRYbWPB/S1PkDGRthK8lPLgr5FD+pnPdrqp/Rfnw0mBNhGeFe+QQBxaqFOcZ5wlftU/SDz2eladPlxl6Q=="
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCHOuTg8abvMi6lP2K80OBK2Ka8USV0y7EBnlEq0+Xxd7j9HtIWkSzw06/m7rxu4LpmSLptV/LwF7VXe3Uhb/iKcNK3xFVGld40rAzyTPJKIMTKe1N85q4YEtEdHU0lCW9S8whWkVMa8KMTxEjiHmIZhooGnJbEe/D6muFjlSAALmlNtHFpnsvN8SSpwJCLUy/MIZ76DdhKN5CFwMGExWqaJj8JDqEm/F8n7ghp2WmONjIJLVOsPgKrixvEyc9Q0K3ff5LRhoYK8TA77b7MilZiMSqyJEyFTQYyKjO98XCLZZlEbWZG60d/wutR4CfpU6cuCrk8T01mVSh8kz8JxzuX"
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