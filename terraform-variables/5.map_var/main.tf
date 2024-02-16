resource "aws_instance" "web_server" {
  instance_type = var.web_instance["prod"]
  ami           = var.web_instance["ami_id"]

  tags = {
    Name = "web_server"
  }
}

