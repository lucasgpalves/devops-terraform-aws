output "backend_instance_id" {
  description = "ID da instância backend"
  value       = aws_instance.backend.id
}

output "backend_private_ip" {
  description = "IP privado da instância backend"
  value       = aws_instance.backend.private_ip
}
