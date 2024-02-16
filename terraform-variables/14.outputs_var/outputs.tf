output "instance_type" {
  value = var.instance_type
}

output "ami" {
  value = var.ami
}

output "instance_id" {
 value       = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}


