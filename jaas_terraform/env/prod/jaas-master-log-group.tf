module "jaas_prod_master_log_group" {
  source      = "../../modules/log-group"
  name              = "jaas-prod-master-log-us-east-1"
  retention_in_days = 365
}