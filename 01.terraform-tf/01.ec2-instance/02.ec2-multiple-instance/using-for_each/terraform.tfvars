## terraform.tfvars

#instance_type     = "t3.micro"
ami_id            = "ami-0abcdef1234567891"

# security_group_id = "sg-0123456789abcdef0"
# key_name         = "my-keypair"

#subnet_id        = "subnet-0123456789abcdef0"

## For LocalStack/Floci 
subnet_id        = "subnet-default-a"


### For MAP variables:  
instances = {

  ## key1
  web_server_1 = {
    instance_type = "t3.micro"
    tag_name     = "dev"
  }

  ## key2
  web_server_2 = {
    instance_type = "t3.small"
    tag_name     = "qa"
  }

  ## key3
  web_server_3 = {
    instance_type = "t3.medium"
    tag_name     = "prod"
  }
}


