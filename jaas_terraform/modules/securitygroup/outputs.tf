output "this_security_group_id" {
  description = "The ID of the security group"
  value = concat(
    aws_security_group.this_name_prefix.*.id,
    [""],
  )[0]
}