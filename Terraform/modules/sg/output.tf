output "sg_id_alb" {
  description = "ALB Security Group ID"
  value       = aws_security_group.alb.id
}

output "sg_id_ecs" {
  description = "ECS Security Group ID"
  value       = aws_security_group.ecs.id
}