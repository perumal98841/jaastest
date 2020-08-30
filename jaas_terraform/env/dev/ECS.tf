module "ECS_jaas_ecs" {
    source      = "../../modules/ecs_fargate"
    aws_region = "us-east-1"
    app_name = "ECS_jaas"
    env_name = "dev"
    subnets            = [module.jaas_dev_vpc.private_subnets[0],module.jaas_dev_vpc.private_subnets[1]]
    security_groups    = module.sg_jaas_master.this_security_group_id
  
    image_name = "187945997467.dkr.ecr.us-east-1.amazonaws.com/jaas-dev:jaas-v1.3"
    cpu_units         = 1024
    ram_units         = 2048
    task_group_family = "dev-jaas-task"
    container_port    = 8080
    target_group_arn = module.ECS_jaas_dev_alb.target_group_arns[0]
    task_role_arn = module.jaas_iam_role_master.arn
    execution_role_arn = module.jaas_iam_role_master.arn
    
    volume_name = "jenkins-storage"
    file_system_id          = module.ECS_jaas_efs.id
}