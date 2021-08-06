module "records" {
    source      = "../../modules/route53_record"

  zone_id = "Z002405022GDTV5588PWC"
  create = "true"
  records = [
     {
      name = "jenkins"
      type = "CNAME"
      ttl  = 3600
      records = ["${module.jaas_prod_alb.this_lb_dns_name}"]
    },
  ]
}