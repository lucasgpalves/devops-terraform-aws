# Security Group para o Frontend
resource "aws_security_group" "frontend_sg" {
  name        = "frontend-sg"
  description = "Security group para a instância do frontend"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Permitir tráfego HTTP para Next.js na porta 3000"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "Permitir saída para qualquer destino"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend-sg"
  }
}

# Security Group para o Backend
resource "aws_security_group" "backend_sg" {
  name        = "backend-sg"
  description = "Security group para a instância do backend"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Permitir tráfego para Spring Boot na porta 8080"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Permitir tráfego para Flask na porta 5000"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Permitir tráfego para comunicação interna com o Frontend"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "Permitir saída para qualquer destino"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-sg"
  }
}

# Security Group para o RDS (PostgreSQL)
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security group para o banco de dados RDS PostgreSQL"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Permitir tráfego para PostgreSQL na porta 5432 a partir do backend"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    security_groups  = [aws_security_group.backend_sg.id] # Apenas o backend acessa o RDS
  }

  egress {
    description      = "Permitir saída para qualquer destino"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}
