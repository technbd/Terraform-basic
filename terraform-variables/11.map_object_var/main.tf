# resource "aws_instance" "web_server" {
#   for_each = var.instance_sizes

#   instance_type = var.instance_sizes[each.key].instance_type
#   ami           = var.instance_sizes[each.key].ami
#   subnet_id     = var.instance_sizes[each.key].subnet_id
#   key_name      = var.instance_sizes[each.key].key_name

#   # Other configuration for instances...

#     tags = {
#       tag_name = var.instance_sizes[each.key].tag_name
#     }

# }


####### Or ##########


resource "aws_instance" "web_app" {
  for_each = var.instance_sizes
  #for_each = { for i in var.instance_sizes : i.instance_type => i }

  instance_type = each.value.instance_type
  ami           = each.value.ami
  subnet_id     = each.value.subnet_id
  key_name      = each.value.key_name

  # Other configuration for instances...

  tags = {
    tag_name = each.value.tag_name
  }

}

