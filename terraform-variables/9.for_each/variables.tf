### For Set:
variable "set_instance" {
  type = set(string)
  default = ["dev", "prod"]
}


### For MAP:
variable "map_instance" {
  type = map(string)

  default = {
    "instance_1" = "dev",
    "instance_2" = "prod"
  }
}

