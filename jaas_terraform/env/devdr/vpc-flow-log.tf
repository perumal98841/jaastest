resource "aws_flow_log" "jaas-devdr-vpc-flow-log" {
  log_destination      = module.jaas_devdr_logs_s3_bucket.s3_bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = module.jaas_dev_vpc.vpc_id
}