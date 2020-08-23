data "aws_iam_policy_document" "master_policy" {
  statement {
    sid       = "AllowSecretManagerAccess"
    actions   = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:ListSecrets",
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ecr_policy" {
  statement {
    sid       = "AllowAccessECR"
    actions   = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:GetAuthorizationToken",
      "ecr:UploadLayerPart",
      "ecr:InitiateLayerUpload",
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer",
      "ecr:PutImage",
    ]
    resources = ["*"]
  }
}

module "jaas_iam_policy_master" {
  source = "../../modules/iam_role_policy"
  policy_name = "jaas-master-policy"
  policy = data.aws_iam_policy_document.master_policy.json
  role = module.jaas_iam_role_master.id
}

module "jaas_iam_policy_master_ecr" {
  source = "../../modules/iam_role_policy"
  policy_name = "jaas-ecr-policy"
  policy = data.aws_iam_policy_document.ecr_policy.json
  role = module.jaas_iam_role_master.id
}