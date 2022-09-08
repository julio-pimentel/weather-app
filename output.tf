output "lb_dns_name" {
  description = "Load Balancer DNS name"
  value = module.lb.lb_dns_name
}

output "lb_tg_arn" {
  description = "Load Balancer Target Group ARN"
  value = module.lb.lb_tg_arn
}

output "ecs_task_arn" {
  description = "ECS Task ARN"
  value = module.ecs.ecs_task_arn
}