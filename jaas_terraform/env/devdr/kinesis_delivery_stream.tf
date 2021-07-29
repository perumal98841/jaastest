module "jaas_devdr_delivery_stream" {
    source      = "../../modules/kinesis_delivery_stream"
    name        = "aws-waf-logs-jaas-devdr-delivery-stream"
    destination = "splunk"

#s3_configuration 
    prefix = "WAFlogs"
    compression_format = "GZIP"
    buffer_interval    = 400  
    buffer_size        = 10  
  
    role_arn           = module.jaas_iam_role_kinesis.arn
    bucket_arn         = module.jaas_devdr_logs_s3_bucket.s3_bucket_arn


#Splunk configuration 

    hec_endpoint               = "https://http-inputs-hidglobal.splunkcloud.com:443/services/collector"
    hec_token                  = "WillBeReplaceByJenkins"
    hec_acknowledgment_timeout = 180
    hec_endpoint_type          = "Raw"
    s3_backup_mode             = "AllEvents"

}