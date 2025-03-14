module "jaas_dev_logs_s3_bucket" {
    source      = "../../modules/s3-bucket"
 bucket = "jaas-dev-logs-us-east-1"
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy = true

  attach_elb_log_delivery_policy = true
}
