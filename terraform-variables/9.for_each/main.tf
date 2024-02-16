## For Set: a set, each.value and each.key is the same:

resource "aws_instance" "by_set" {
  for_each = var.set_instance

  instance_type = "t2.micro"
  ami = "ami-0b08bfc6ff7069aff"

  tags = {
    Name = each.value #Or (Any one: value or key)
    #Name = each.key
  }
}


### For MAP: a map, it is the map’s key, e.g. {map_key: “map_value” }

resource "aws_instance" "by_map" {
  for_each = var.map_instance

  ami = "ami-0b08bfc6ff7069a78"
  instance_type = "t2.micro"

  tags = {
    Name = each.value  #Used any one (value or key)  or Both
    ID = each.key
  }
}

