resource "aws_instance" "web_server" {
  instance_type = "t2.micro"
  ami           = "ami-12345678"
  count         = var.instance_count

  tags = {
    Name = "web-instance-${count.index + 1}"
  }
}
