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

rules = [
    {
      name     = "AWSManagedRulesAmazonIpReputationList-rule-1"
      priority = "1"

      override_action = "none" # set to none if not specified

      visibility_config = {
        metric_name                = "AWSManagedRulesAmazonIpReputationList-metric"
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    },
    {
      name     = "AWSManagedRulesCommonRuleSet-rule-2"
      priority = "2"

      override_action = "none" # set to none if not specified

      visibility_config = {
        metric_name                = "AWSManagedRulesCommonRuleSet-metric"
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
        excluded_rule = [
          "NoUserAgent_HEADER",
          "SizeRestrictions_BODY",
          "EC2MetaDataSSRF_BODY",
          "GenericLFI_QUERYARGUMENTS",
          "GenericRFI_QUERYARGUMENTS",
          "GenericRFI_BODY"
        ]
      }
    },
    {
      name     = "AWSManagedRulesKnownBadInputsRuleSet-rule-3"
      priority = "3"

      override_action = "none"

      visibility_config = {
        metric_name = "AWSManagedRulesKnownBadInputsRuleSet-metric"
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
  ]

    business_tags = {
        BU = "ProductIT"
        CostCenter = "6465"
        Owner = "Perumal Varadharajulu"
        Email = "perumal.varadharajulu@hidglobal.com"
    }
    technical_tags = {
        Env = "dev"
        Product = "Jenkins-as-a-Service"
        Terraform = "True"
    }
}