variable "ami_id" {
  description = "AMI ID para a instância EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.medium" # Recomendado para aplicações com Docker
}

variable "subnet_id" {
  description = "ID da sub-rede privada onde a instância será criada"
  type        = string
}

variable "security_groups" {
  description = "Lista de grupos de segurança associados à instância"
  type        = list(string)
}
