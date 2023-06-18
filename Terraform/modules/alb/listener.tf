resource "aws_lb_listener" "ecs_fargate" {
  for_each = { for k, v in var.ecs_listeners : k => v }

  load_balancer_arn = aws_lb.application.arn
  port              = each.value.port
  protocol          = each.value.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_fargate.arn
  }
}
