module "records" {
    source      = "../../modules/route53_record"

  zone_id = "Z000275123DCSJ4HQ0KOY"

  records = [
     {
      name = "jenkins"
      type = "CNAME"
      ttl  = 3600
      records = ["${module.jaas_prod_alb.this_lb_dns_name}"]
    },
  ]
}