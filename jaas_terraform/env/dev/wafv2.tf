module "jaas_dev_wafv2" {
  source      = "../../modules/wafv2"
  name_prefix = "jaas-dev-wafv2"
  alb_arn     = module.jaas_dev_alb.this_lb_arn

  scope = "REGIONAL"
  create_alb_association = true

  allow_default_action = false # set to allow if not specified

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


regular_expressions = [
    {
      name     = "JaaS-Context-rule-3"
      priority = "4"

      visibility_config = {
        metric_name = "JaaS-Context-metric"
      }

      regex_pattern_set_reference_statement = {
        arn = "arn:aws:wafv2:us-east-1:187945997467:regional/regexpatternset/jaas-dev-regex/a68685bf-f73c-425f-99cb-987cb3d43f68"
        field_to_match = "uri_path"
        priority = 0
        type = "NONE"
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