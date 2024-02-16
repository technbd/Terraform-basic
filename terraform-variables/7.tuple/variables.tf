
variable "ec2_instance" {
 description = "This is a variable of type tuple"

 type = tuple([
   string,  
   string,   
   string,
   string
  ])
   
 default = [
   "t2.micro", 
   "ami-123456", 
   "web-app",
   "dev"
  ]

}

