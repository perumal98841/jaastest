data "aws_iam_policy_document" "cpm_policy1" {
  statement {
    sid       = "EFS"
    actions   = [
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeTags",
        "elasticfilesystem:CreateTags",
        "elasticfilesystem:DescribeLifecycleConfiguration",
        "elasticfilesystem:PutLifecycleConfiguration",
        "elasticfilesystem:UpdateFileSystem",
        "backup:StartBackupJob",
        "backup:DescribeBackupJob",
        "backup:ListBackupJobs",
        "backup:ListBackupVaults",
        "backup:GetRecoveryPointRestoreMetadata",
        "backup:ListTags",
        "backup:StartRestoreJob",
        "backup:DescribeRestoreJob",
        "backup:ListRestoreJobs",
        "backup:DeleteRecoveryPoint",
        "backup:DescribeRecoveryPoint",
        "backup:UpdateRecoveryPointLifecycle",
        "backup:StartCopyJob",
        "backup:DescribeCopyJob",
        "iam:ListRoles"    ]
    resources = ["*"]
  }
}

module "jaas_iam_policy_cpm_policy1" {
  source = "../../modules/iam_role_policy"
  policy_name = "BakR-CPM-Policy-BYOL_1"
  policy = data.aws_iam_policy_document.cpm_policy1.json
  role = module.jaas_iam_role_backup.id
}