output "alb_dns_name" {
  value = aws_lb.web.dns_name
}

output "instance_id" {
  value = aws_instance.web.id
}