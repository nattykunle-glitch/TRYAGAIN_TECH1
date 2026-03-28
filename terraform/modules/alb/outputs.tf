output "alb_dns" {
  value = aws_lb.this.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.frontend.arn
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
  
}
output "listener_arn" {
  value = aws_lb_listener.http.arn
}