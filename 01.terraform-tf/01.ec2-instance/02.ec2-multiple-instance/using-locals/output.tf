### Output for EC2 Instances:

## Output all instance IDs
output "instance_ids" {
  value = {
    for key, instance in aws_instance.web_server :
    key => instance.id
  }
}

## Output all instance type
output "instance_type" {
  value = {
    for key, instance in aws_instance.web_server :
    key => instance.instance_type
  }
}


## All output details
output "instances" {
  value = {
    for key, instance in aws_instance.web_server :
    key => {
      ami = instance.ami
      arn = instance.arn
      availability_zone = instance.availability_zone
      security_groups = instance.security_groups
      subnet_id = instance.subnet_id
      public_ip  = instance.public_ip
      private_ip = instance.private_ip
      public_dns = instance.public_dns
      private_dns = instance.private_dns

    }

  }
}

