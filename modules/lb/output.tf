output "lb_dns_name" {
  description = "ALB DNS name"
  value       = aws_alb.lb.dns_name
}

output "lb_tg_arn" {
  description = "ALB TG ARN"
  value       = aws_alb_target_group.lb_tg.arn
}