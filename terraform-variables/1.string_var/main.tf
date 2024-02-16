resource "aws_instance" "web_server" {
  instance_type = var.instance_type
  ami           = var.ami_id

  tags = {
    Name = "web_server"
  }
}
