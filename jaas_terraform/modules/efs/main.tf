locals {
  dns_name = "${join("", aws_efs_file_system.default.*.id)}.efs.${var.aws_region}.amazonaws.com"
}

resource "aws_efs_file_system" "default" {
  count                           = var.enabled ? 1 : 0
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_id
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = var.transition_to_ia == "" ? [] : [1]
    content {
      transition_to_ia = var.transition_to_ia
    }
  }
  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.business_tags,
    var.technical_tags,
  )
}

resource "aws_efs_mount_target" "default" {
  count           = var.enabled && length(var.subnets) > 0 ? length(var.subnets) : 0
  file_system_id  = join("", aws_efs_file_system.default.*.id)
  ip_address      = var.mount_target_ip_address
  subnet_id       = var.subnets[count.index]
  security_groups = var.security_groups
}