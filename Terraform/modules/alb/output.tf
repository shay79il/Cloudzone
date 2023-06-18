output "tg_ecs_fargate_arn" {
  description = "Target Group ARN of the ECS Fargate"
  value       = aws_lb_target_group.ecs_fargate.arn
}
output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.application.dns_name
}