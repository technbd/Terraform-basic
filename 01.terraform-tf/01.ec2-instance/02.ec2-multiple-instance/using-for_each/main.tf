## Resource Block:

resource "aws_instance" "web_server" {
  ## Using for_each
  for_each = var.instances

  instance_type = each.value.instance_type

  ami           = var.ami_id 
  
  security_groups      = [aws_security_group.web_server_sg.name]

  # Optional: Add your key pair name if you want to SSH into the instance
  # key_name           = "your-key-pair-name"

  subnet_id     = var.subnet_id

  associate_public_ip_address = true
  
  tags = {
    Name = each.key                        # web_server_1, web_server_2
    Environment = each.value.tag_name      # dev, qa, prod
  }

}


