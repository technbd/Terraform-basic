
### Example-1:

locals {
  ami      = "ami-065deacbcaac64cf2"
  type     = "t2.micro"
  name_tag = "dev"
}


resource "aws_instance" "my_vm" {
 ami           = local.ami 
 instance_type = local.type

 tags = {
   Name = local.name_tag
 }
 
}


### Example-2:

locals {
 server_names=["backend-dev-a", "backend-dev-b", "backend-dev-c"]
}


resource "aws_instance" "backend_server" {
 ami           = "ami-07355fe79b493752d"
 instance_type = "t2.micro"

 count         = length(local.server_names)

 tags          = {
   Name = local.server_names[count.index]
 }

}


### Example-2:

locals {
 server_names=["backend-dev-a", "backend-dev-b", "backend-dev-c"]
}

variable "instance_type" {
  type	= string
  default = "t2.micro"
}


resource "aws_instance" "backend_server" {
 ami           = "ami-07355fe79b4937cf"
 instance_type = var.instance_type

 count         = var.instance_type == "t2.micro" ? 3 : 1

 tags          = {
   Name = local.server_names[count.index]
 }

}

