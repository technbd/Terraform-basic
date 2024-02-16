variable "set_example" {
  description = "This is a variable of type Set"
  type = set(string)
  default = ["t2.micro", "ami-123456", "web-app", "dev", "dev"]
  
}



