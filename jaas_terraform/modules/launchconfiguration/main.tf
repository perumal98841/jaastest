resource "aws_launch_configuration" "this" {
  count = var.create_lc ? 1 : 0
  name                        = var.name
  image_id                    = var.image_id
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = var.key_name
  security_groups             = var.security_groups
  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  enable_monitoring           = var.enable_monitoring

  lifecycle {
    create_before_destroy = true
  }
}