module "jaas_master_dev_log_group" {
  source      = "../../modules/log-group"
  name              = "jaas_master-dev-log"
  retention_in_days = 15
}