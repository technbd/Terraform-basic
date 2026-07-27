## Local variables:

locals {
  instances = {
    web_server_1 = "t3.micro"
    web_server_2 = "t3.small"
    web_server_3 = "t3.medium"
  }
}


## Resource Block:

resource "aws_instance" "web_server" {
  ## Using for_each
  for_each = local.instances

  instance_type = each.value 

  ami           = var.ami_id 
  
  security_groups      = [aws_security_group.web_server_sg.name]

  # Optional: Add your key pair name if you want to SSH into the instance
  # key_name           = "your-key-pair-name"

  subnet_id     = var.subnet_id

  associate_public_ip_address = true
  
  tags = {
    Name = each.key             # web_server_1, web_server_2, web_server_3
  }

}


