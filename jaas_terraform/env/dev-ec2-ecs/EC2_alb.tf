resource "random_pet" "EC2_this" {
  length = 2
}

#### Application Load Balancer ####
module "EC2_jaas_dev_alb" {
    source      = "../../modules/alb"

  name = "EC2-jaas-dev-alb-${random_pet.EC2_this.id}"

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
      certificate_arn    = "arn:aws:acm:us-east-1:187945997467:certificate/d7a6f6ce-61cf-4b49-95b5-5894dc776e47"
      target_group_index = 0
    },
  ]

  target_groups = [
    {
      name_prefix          = "EC2"
      backend_protocol     = "HTTP"
      backend_port         = 8080
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
        InstanceTargetGroupTag = "EC2-baz"
      }
    },
  ]
}