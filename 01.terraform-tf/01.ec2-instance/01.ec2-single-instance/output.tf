### Output for EC2 Instances:

output "id" {
  value       = aws_instance.web_server.id
  description = "AWS EC2 instance ID"
}

output "instance_type" {
  value       = aws_instance.web_server.instance_type
  description = "AWS EC2 instance type"
}

output "ami" {
  value       = aws_instance.web_server.ami
  description = "AWS EC2 instance type"
}

output "arn" {
  value       = aws_instance.web_server.arn
  description = "AWS EC2 instance type"
}

output "availability_zone" {
  value       = aws_instance.web_server.availability_zone
  description = "AWS EC2 instance type"
}

output "security_groups" {
  value       = aws_instance.web_server.security_groups
  description = "security groups"
}

output "key_name" {
  value       = aws_instance.web_server.key_name
  description = "key pair"
}

output "subnet_id" {
  value = aws_instance.web_server.subnet_id
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "private_ip" {
  value = aws_instance.web_server.private_ip
}

output "public_dns" {
  value = aws_instance.web_server.public_dns
}

output "private_dns" {
  value = aws_instance.web_server.private_dns
}


