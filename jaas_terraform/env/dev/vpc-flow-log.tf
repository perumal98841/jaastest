resource "aws_flow_log" "jaas-dev-vpc-flow-log" {
  log_destination      = module.jaas_dev_logs_s3_bucket.s3_bucket_id
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = module.jaas_dev_vpc.vpc_id
}