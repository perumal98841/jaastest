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
  source = "../../modules/iam_policy"
  policy_name = "jaas-master-policy"
  policy_path = "/"
  policy_description = "Jenkins-as-a-Server Master policy"
  policy = data.aws_iam_policy_document.master_policy.json
}