# main.tf
resource "aws_instance" "example" {
  for_each = { for sanbox in var.sandboxes : sanbox.name => sanbox }

  instance_type = each.value.instance_type
  ami           = each.value.ami

  tags = {
    Name = each.value.name
  }

}

