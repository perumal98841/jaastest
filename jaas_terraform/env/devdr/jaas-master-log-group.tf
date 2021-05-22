module "jaas_dev_master_log_group" {
  source      = "../../modules/log-group"
  name              = "jaas-dev-master-log-eu-east-1"
  retention_in_days = 14
}