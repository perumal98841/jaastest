resource "aws_autoscaling_group" "this_with_initial_lifecycle_hook" {
  count = var.create_asg && var.create_asg_with_initial_lifecycle_hook ? 1 : 0

  launch_configuration = var.launch_configuration
  vpc_zone_identifier  = var.vpc_zone_identifier
  max_size             = var.max_size
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity

  load_balancers            = var.load_balancers
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type

  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  target_group_arns         = var.target_group_arns
  default_cooldown          = var.default_cooldown
  force_delete              = var.force_delete
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  placement_group           = var.placement_group
  enabled_metrics           = var.enabled_metrics
  metrics_granularity       = var.metrics_granularity
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn

  initial_lifecycle_hook {
    name                    = var.initial_lifecycle_hook_name
    lifecycle_transition    = var.initial_lifecycle_hook_lifecycle_transition
    notification_metadata   = var.initial_lifecycle_hook_notification_metadata
    heartbeat_timeout       = var.initial_lifecycle_hook_heartbeat_timeout
    notification_target_arn = var.initial_lifecycle_hook_notification_target_arn
    role_arn                = var.initial_lifecycle_hook_role_arn
    default_result          = var.initial_lifecycle_hook_default_result
  }

  lifecycle {
    create_before_destroy = true
  }
}