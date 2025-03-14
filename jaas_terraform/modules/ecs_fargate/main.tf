locals {
  ecs_container_definitions = [
    {
      image       = var.image_name
      name        = "${var.env_name}-${var.app_name}",
      networkMode = "awcvpc",

      portMappings = [
        {
          containerPort = var.container_port,
          hostPort      = var.container_port
        }
      ]
      mountPoints = [
                {
                    sourceVolume = var.volume_name,
                    containerPath = var.containerPath
                }
            ]

#      logConfiguration = {
#        logDriver = "awslogs",
#        options = {
#          awslogs-group         = "${aws_cloudwatch_log_group.fargate.name}",
#          awslogs-region        = "${var.region}",
#          awslogs-stream-prefix = "ecs"
#        }
#      }
    }
  ]
}

resource "aws_ecs_task_definition" "fargate" {
  family                   = var.task_group_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu_units
  memory                   = var.ram_units
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode(local.ecs_container_definitions)
    volume {
    name = var.volume_name

    efs_volume_configuration {
      file_system_id          = var.file_system_id
      root_directory          = var.root_directory
    }
  }
}

resource "aws_ecs_cluster" "fargate" {
  name = "${var.env_name}-${var.app_name}-cluster"

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider_strategy {
    capacity_provider = var.capacity_provider
  }
}

resource "aws_ecs_service" "fargate" {
  platform_version = var.platform_version
  depends_on = [aws_ecs_task_definition.fargate]
  name                               = "${var.env_name}-${var.app_name}-service"
  cluster                            = aws_ecs_cluster.fargate.id
  task_definition                    = aws_ecs_task_definition.fargate.arn
  desired_count                      = var.desired_tasks
  deployment_maximum_percent         = var.maxiumum_healthy_task_percent
  deployment_minimum_healthy_percent = var.minimum_healthy_task_percent

  capacity_provider_strategy {
    capacity_provider = var.capacity_provider
    weight            = 100
  }

  network_configuration {
    assign_public_ip = false
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  load_balancer {
      target_group_arn = var.target_group_arn
      container_name   = "${var.env_name}-${var.app_name}"
      container_port   = var.container_port
  }
}