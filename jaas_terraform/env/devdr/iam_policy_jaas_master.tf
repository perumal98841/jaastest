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

data "aws_iam_policy_document" "ec2_policy" {
  statement {
    sid       = "AllowAccessEC2"
    actions   = [
      "ec2:DescribeSpotInstanceRequests",
      "ec2:CancelSpotInstanceRequests",
      "ec2:GetConsoleOutput",
      "ec2:RequestSpotInstances",
      "ec2:RunInstances",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:TerminateInstances",
      "ec2:CreateTags",
      "ec2:DeleteTags",
      "ec2:DescribeInstances",
      "ec2:DescribeKeyPairs",
      "ec2:DescribeRegions",
      "ec2:DescribeImages",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "iam:ListInstanceProfilesForRole",
      "iam:PassRole",
      "ec2:GetPasswordData",
              ]
    resources = ["*"]
  }
}


module "jaas_iam_policy_master_dr" {
  source = "../../modules/iam_role_policy"
  policy_name = "jaas-master-policy-dr"
  policy = data.aws_iam_policy_document.master_policy.json
  role = module.jaas_iam_role_master_dr.id
}

module "jaas_iam_policy_master_ecr_dr" {
  source = "../../modules/iam_role_policy"
  policy_name = "jaas-ecr-policy-dr"
  policy = data.aws_iam_policy_document.ecr_policy.json
  role = module.jaas_iam_role_master_dr.id
}

module "jaas_iam_policy_master_ec2_dr" {
  source = "../../modules/iam_role_policy"
  policy_name = "jaas-ec2-policy-dr"
  policy = data.aws_iam_policy_document.ec2_policy.json
  role = module.jaas_iam_role_master_dr.id
}