resource "aws_instance" "backend-server" {
    ami                             =   var.ami_id
    instance_type                   =   var.instance_type
    subnet_id                       =   var.subnet_id
    associate_public_ip_address     =   false
    security_groups                 =   var.security_groups

    tags = {
        Name = "backend-ec2"
    } 
}

output "backend_instance_id" {
    value = aws_instance.backend-server
}

output "backend_private_ip" {
    value = aws_instance.backend-server.private_ip
}