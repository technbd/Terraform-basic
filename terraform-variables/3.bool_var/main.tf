
resource "aws_instance" "web_server" {
  instance_type = "t2.micro"
  ami           = "ami-12345678"
  count = var.enable_feature ? 1 : 0
}

