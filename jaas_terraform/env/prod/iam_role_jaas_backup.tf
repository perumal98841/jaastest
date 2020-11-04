module "jaas_iam_role_backup" {
  source = "../../modules/iam_role"


  role_name = "BakRCrossAccountRole"

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::426385313456:root"
        },
        "Action": "sts:AssumeRole",
        "Condition": {}
      }
    ]
  }
  EOF
}