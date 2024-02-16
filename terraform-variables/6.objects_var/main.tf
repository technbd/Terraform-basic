resource "aws_instance" "app_server" {
  instance_type = var.instance_config.instance_type
  ami           = var.instance_config.ami_id 
  key_name      = var.instance_config.key_name

  tags = {
    Name = "web_server"
  }
}
