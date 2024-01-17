# aws_wafv2_regex_pattern_set.example:
resource "aws_wafv2_regex_pattern_set" "jaas_prod_regex_pattern_set" {

    name        = "jaas-prod-regex-pattern-set"
    scope       = "REGIONAL"

    regular_expression {
        regex_string = "(^/ad-health/*|^/administrativeMonitor/*|^/checkDisplayName/*|^/plugin/*|^/images/*|^/descriptor/*|^/help/*|^/markupFormatter/*|^/cloud/*)"
    }
    regular_expression {
        regex_string = "(^/ajaxBuildQueue|^/ajaxExecutors|^/favicon.ico|^/\\/static/*|^/.?stapler/*|^/j_acegi_security_check|^/newView|^/createView|^/j_spring_security_check|^/checkViewName)"
    }
    regular_expression {
        regex_string = "(^/configureSecurity/*|^/credentials/*|^/configureCredentials/*|^/role-strategy/*|^/securityRealm//*|^/scriptApproval/*|^/descriptorByName/*)"
    }
    regular_expression {
        regex_string = "(^/configureTools/*|^/pluginManager/*|^/computer/*|^/aws/*|^/configuration-as-code/*|^/administrativeMonitor/*)"
    }
    regular_expression {
        regex_string = "(^/manage/*|^/job/*|^/view/*|^/pluginusage/*|^/lockable-resources/*|^/git/*|^/i18n/*)"
    }
    regular_expression {
        regex_string = "(^/me/*|^/fingerprintCheck/*|^/projectRelationship/*|^/asynchPeople/*|^/newView/*)"
    }
    regular_expression {
        regex_string = "(^/systemInfo/*|^/extensionList/*|^/log/*|^/load-statistics/*|^/overallLoad/*|^/about/*|^/configSubmit)"
    }
    regular_expression {
        regex_string = "(^/user/*|^/logout/*|^/static/*|^/adjuncts/*|^/editDescription/*|^/configure/*|^/defaultJDKCheck|^/publisher/ExtendedEmailPublisher/*)"
    }
}

output "jaas-prod-regex-pattern-set_arn" {
  description = "The ARN of the Regex Pattern."
  value       = join("", aws_wafv2_regex_pattern_set.jaas_prod_regex_pattern_set.*.arn)
}