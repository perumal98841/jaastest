data "aws_iam_policy_document" "firehose_s3" {
  statement {
    sid       = "AllowSecretManagerAccess"
    actions   = [
            "s3:AbortMultipartUpload",
            "s3:GetBucketLocation",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:ListBucketMultipartUploads",
            "s3:PutObject",
    ]
    resources = ["*"]
  }
}

module "jaas_iam_policy_kinesis" {
  source = "../../modules/iam_role_policy"
  policy_name = "jaas-kinesis-policy"
  policy = data.aws_iam_policy_document.firehose_s3.json
  role = module.jaas_iam_role_kinesis.id
}
