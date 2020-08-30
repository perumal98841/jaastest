module "ECS_jaas_ecs" {
    source      = "../../modules/ecs_fargate"
    aws_region = "us-east-1"
    app_name = "ECS_jaas"
    env_name = "dev"
    subnets            = [module.jaas_dev_vpc.private_subnets[0],module.jaas_dev_vpc.private_subnets[1]]
    security_groups    = module.sg_jaas_master.this_security_group_id
  
    image_name = "nginx"
    cpu_units         = 256
    ram_units         = 512
    task_group_family = "dev-jaas-task-definition"
    container_port    = 80
    target_group_arn = module.ECS_jaas_dev_alb.target_group_arn
}