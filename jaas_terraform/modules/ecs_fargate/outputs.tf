
output "cluster_arn" {
  description = "ECS Cluster ARN"
  value       = aws_ecs_cluster.fargate.arn
}

output "task_definition" {
  description = "Task Defintion"
  value       = aws_ecs_task_definition.fargate
}