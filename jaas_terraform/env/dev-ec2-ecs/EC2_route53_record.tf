module "EC2_records" {
    source      = "../../modules/route53_record"

  zone_id = "Z000275123DCSJ4HQ0KOY"

  records = [
     {
      name = "ec2jenkins"
      type = "CNAME"
      ttl  = 3600
      records = ["${module.EC2_jaas_dev_alb.this_lb_dns_name}"]
    },
  ]
}