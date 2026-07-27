## terraform.tfvars

instance_type     = "t3.micro"
ami_id            = "ami-0abcdef1234567891"

# security_group_id = "sg-0123456789abcdef0"
# key_name         = "my-keypair"

#subnet_id        = "subnet-0123456789abcdef0"

## For LocalStack/Floci 
subnet_id        = "subnet-default-a"

instance_count   = 3    # Creates 3 identical instances

