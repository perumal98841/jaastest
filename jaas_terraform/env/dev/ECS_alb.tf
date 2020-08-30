resource "random_pet" "ECS_this" {
  length = 2
}

#### Application Load Balancer ####
module "ECS_jaas_dev_alb" {
    source      = "../../modules/alb"

  name = "ECS-jaas-dev-alb-${random_pet.EC2_this.id}"

  load_balancer_type = "application"

    vpc_id = module.jaas_dev_vpc.vpc_id
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
      certificate_arn    = "arn:aws:acm:us-east-1:187945997467:certificate/f9a9a5da-e5c6-44f0-879b-5096aaefaac0"
      target_group_index = 0
    },
  ]

  target_groups = [
    {
      name_prefix          = "ECS"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "forward"
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
        InstanceTargetGroupTag = "EC2-baz"
      }
    },
  ]
}