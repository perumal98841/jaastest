locals {
  this_sg_id = concat(
    aws_security_group.this_name_prefix.*.id,
    [""],
  )[0]
}

resource "aws_security_group" "this_name_prefix" {
  count = var.create && var.use_name_prefix ? 1 : 0

  name_prefix            = "${var.name}-"
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.business_tags,
    var.technical_tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ingress_rules" {
  count = var.create ? length(var.ingress_rules) : 0

  security_group_id = local.this_sg_id
  type              = "ingress"

  cidr_blocks      = var.ingress_cidr_blocks
  description      = var.rules[var.ingress_rules[count.index]][3]

  from_port = var.rules[var.ingress_rules[count.index]][0]
  to_port   = var.rules[var.ingress_rules[count.index]][1]
  protocol  = var.rules[var.ingress_rules[count.index]][2]
}