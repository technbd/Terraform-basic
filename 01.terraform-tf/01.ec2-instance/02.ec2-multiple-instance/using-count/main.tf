## Provider Block 


## Resource Block:
resource "aws_instance" "web_server" {
  ## Using count (Simple)
  count         = var.instance_count

  instance_type = var.instance_type
  ami           = var.ami_id 
  
  security_groups      = [aws_security_group.web_server_sg.name]

  # Optional: Add your key pair name if you want to SSH into the instance
  # key_name           = "your-key-pair-name"

  subnet_id     = var.subnet_id

  associate_public_ip_address = true
  
  tags = {
    Name = "web_server-${count.index}"    # Names: web_server-0, web_server-1, web_server-2
    Environment = "Dev"
  }

}


