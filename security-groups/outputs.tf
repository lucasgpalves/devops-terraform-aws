output "frontend_sg_id" {
  description = "ID do Security Group para o frontend"
  value       = aws_security_group.frontend_sg.id
}

output "backend_sg_id" {
  description = "ID do Security Group para o backend"
  value       = aws_security_group.backend_sg.id
}

output "rds_sg_id" {
  description = "ID do Security Group para o RDS"
  value       = aws_security_group.rds_sg.id
}
