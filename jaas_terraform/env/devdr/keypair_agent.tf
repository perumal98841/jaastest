module "keypair_agent" {
    source      = "../../modules/keypair"

  key_name   = "jaas-dev-agent-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhftMdGRcbUZup89tGm614GPQ3E1gPnhIdSLYmReWmLDeuWLcJlY/9924bqsbLA36/f4DAncZTgLtLrOdVkcOBERxZGa7JNK4ULrwRT6mDS8NzgTH8XXiHmrMkUGPzQb2TiXtEUdY+N9fXo2mJdec7z9jagv+khI5QWHo5Gx443VDzci4rwRFWuiHjl0prUC6FezeXYQPVN4I+owcMx1X0fzTqSq33t9dSx4tF+P9ERcxa5GzmLIwwrRvoJ2uVjyKWSXcrOVDC9UHI84hsn/dEjkKGr6IaVMMbgMIucWmFo87mqGsSNT8nxOMYIkbZnGL9ZXHZq6K0eGi+OukB9aHHw=="
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