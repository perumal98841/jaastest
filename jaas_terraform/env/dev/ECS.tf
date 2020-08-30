module "ECS_jaas_ecs" {
    source      = "../../modules/ecs_fargate"
    aws_region = "us-east-1"
    app_name = "ECS_JaaS"
    env_name = "DEV"
    subnets            = [module.jaas_dev_vpc.private_subnets[0],module.jaas_dev_vpc.private_subnets[1]]
    security_groups    = module.sg_jaas_master.this_security_group_id
  
    image_name = "nginx"
    cpu_units         = 256
    ram_units         = 512
    task_group_family = "test-task-family"
    container_port    = 80

}