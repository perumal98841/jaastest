ECS_route53_record.tf

module "ECS_records" {
    source      = "../../modules/route53_record"

  zone_id = "Z000275123DCSJ4HQ0KOY"

  records = [
     {
      name = "ecsjenkins"
      type = "CNAME"
      ttl  = 3600
      records = ["${module.ECS_jaas_dev_alb.this_lb_dns_name}"]
    },
  ]
}