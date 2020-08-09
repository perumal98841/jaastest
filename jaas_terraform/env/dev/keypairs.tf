module "master_key_pair" {
    source      = "../../modules/keypair"

  key_name   = "jaas-dev-master-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAk18WOmWfA+kXDqW79L7cWApIETQBOPeKSX3Wr794KByFsiRfP/BcU0O4xqiw4nv+XsuPbXROHy7+ti6o5VqWo1M7+HEDLq7QPdJGlBoQosmLwMCufu0IZxGMTqDqa45HZrfYaq1bpvkGOD6UQV3NWAVVLloV2Lb5c3vReAK4VINHIl3NnAEK9kOpR4beP7DGjuPPe4Wq+kHKEWbpBn2gJpV6+pB4Kxvn9LBjqjpmw5P0eoE85Gtt7q7yDFTFIvNgGe5oqjRYbWPB/S1PkDGRthK8lPLgr5FD+pnPdrqp/Rfnw0mBNhGeFe+QQBxaqFOcZ5wlftU/SDz2eladPlxl6Q=="

}

module "agent_key_pair" {
    source      = "../../modules/keypair"

  key_name   = "jaas-dev-agent-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhftMdGRcbUZup89tGm614GPQ3E1gPnhIdSLYmReWmLDeuWLcJlY/9924bqsbLA36/f4DAncZTgLtLrOdVkcOBERxZGa7JNK4ULrwRT6mDS8NzgTH8XXiHmrMkUGPzQb2TiXtEUdY+N9fXo2mJdec7z9jagv+khI5QWHo5Gx443VDzci4rwRFWuiHjl0prUC6FezeXYQPVN4I+owcMx1X0fzTqSq33t9dSx4tF+P9ERcxa5GzmLIwwrRvoJ2uVjyKWSXcrOVDC9UHI84hsn/dEjkKGr6IaVMMbgMIucWmFo87mqGsSNT8nxOMYIkbZnGL9ZXHZq6K0eGi+OukB9aHHw=="

}