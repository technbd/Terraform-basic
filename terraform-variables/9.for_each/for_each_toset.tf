### Terraform For_each (using "toset") and For Expression:

#vairables.tf
variable "toset_instances" {
  type = set(string)
  default = ["dev", "prod"]
}

#main.tf
resource "aws_instance" "to_set" {

  #for_each = var.toset_instances
  for_each = toset(var.toset_instances)
  
  #for_each = toset(["dev"])
  #for_each = toset(["dev", "prod"])
  
  instance_type = "t2.micro"
  ami           = "ami-0b08bfc6ff7069aff"

  #key_name               = ""
  #vpc_security_group_ids = ""
  #subnet_id              = ""

  tags = {
    # Environment = each.key   #Or (Any one: key or value)
    # Environment = each.value
    Environment = "instance-${each.key}"
    Name        = "web_app"
  }
}

#outputs.tf 
output "instance_names" {
  value = [ for instance in var.toset_instances: aws_instance.to_set[instance].id ]
}

# output "instance_names" {
#   value = [ for instance in aws_instance.to_set: instance.id ]
# }

