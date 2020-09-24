resource "random_pet" "this" {
  length = 2
}

#### Application Load Balancer ####
module "jaas_prod_alb" {
    source      = "../../modules/alb"

  name = "jaas-prod-alb-${random_pet.this.id}"

  load_balancer_type = "application"

    vpc_id = module.jaas_prod_vpc.vpc_id
    internal = true
  security_groups              = module.sg_jaas_alb.this_security_group_id
  subnets         = [module.jaas_dev_vpc.private_subnets[0],module.jaas_dev_vpc.private_subnets[1]]

  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    },
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:acm:us-east-1:187945997467:certificate/954a2440-c467-481e-b3bc-5c2622f279b5"
      target_group_index = 0
    },
  ]

  target_groups = [
    {
      name_prefix          = "h1"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 60
        path                = "/favicon.ico"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      stickiness = {
        enabled         = true
        cookie_duration = 60
        type            = "lb_cookie"
    }      
      tags = {
        InstanceTargetGroupTag = "baz"
      }
    },
  ]
}