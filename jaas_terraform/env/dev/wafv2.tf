module "jaas_dev_wafv2" {
  source      = "../../modules/wafv2"


  name_prefix = "jaas-dev-wafv2"
  alb_arn     = module.jaas_dev_alb.this_lb_arn

  scope = "REGIONAL"

  create_alb_association = true

  allow_default_action = true # set to allow if not specified

  visibility_config = {
    metric_name = "jaas-dev-wafv2-main-metrics"
  }


  tags = {
    "Name" = "test-waf-setup"
    "Env"  = "test"
  }
}