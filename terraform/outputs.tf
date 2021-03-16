output "instance_name" {
  value = aws_instance.application.tags[*]
}

output "ip_address" {
  value = aws_instance.application.public_ip
}

output "elastic_ip" {
  value = aws_eip.ip.public_ip
}