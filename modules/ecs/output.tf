
output "ecs_task_arn" {
  description = "ECS Task ARN"
  value = aws_ecs_task_definition.ecs_task.arn
}
