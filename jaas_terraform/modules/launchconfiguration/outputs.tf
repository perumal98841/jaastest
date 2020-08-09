output "lc_id" {
    value = concat(aws_launch_configuration.this.*.id)
}