data "aws_iam_policy_document" "master_policy" {
  statement {
    sid       = "AllowSecretManagerAccess"
    actions   = ["secretsmanager:GetSecretValue",
                "secretsmanager:ListSecrets",
    ]
    resources = ["*"]
  }
}
module "jaas_iam_policy_master" {
  source = "../../modules/iam_role_policy"
  policy_name = "jaas-master-policy"
  policy = data.aws_iam_policy_document.master_policy.json
  role = module.jaas_iam_role_master.arn
}