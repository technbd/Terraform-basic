## Terraform Basics: 
Terraform is an open-source infrastructure as code (IaC) tool created by HashiCorp. Terraform is one of the most popular Infrastructure-as-code (IaC) tool, used by DevOps teams to automate infrastructure tasks. It is used to automate the provisioning of your cloud resources such as virtual machines, networks, storage, and more. Terraform is an open-source, cloud-agnostic provisioning tool developed by HashiCorp and written in GO language.



### Uses of Terraform:

- Does orchestration, not just configuration management
- Supports multiple providers such as AWS, Azure, Oracle, GCP, and many more
- Provide immutable infrastructure where configuration changes smoothly
- Uses easy to understand language, HCL (HashiCorp configuration language)
- Easily portable to any other provider


### Terraform Lifecycle:
Terraform lifecycle consists of – init, plan, apply, and destroy.



## Terraform Blocks:
The terraform { } block contains Terraform settings, including the required providers Terraform will use to provision your infrastructure.
For each provider, the source attribute defines an optional hostname, a namespace, and the provider type. Terraform installs providers from the Terraform Registry (registry.terraform.io) by default.


### Provider Block:
The provider block is used to define the cloud or infrastructure provider where resources will be provisioned. It includes authentication credentials and other provider-specific configurations. Example:

```
provider "aws" {
  region = "us-west-2"
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_key = "YOUR_AWS_SECRET_KEY"
}
```

### Resource Block: 
The resource block is used to define a specific infrastructure resource provided by the chosen provider. It specifies the resource type and its configuration parameters. Example:

```
resource "<PROVIDER>_<TYPE>" "<NAME>" {
 [CONFIG …]

}
```

```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```


### Variable Block: 
The variable block is used to define input variables that can be used throughout the Terraform configuration. These variables can be assigned values directly or via external sources like environment variables or tfvars files. Example:

```
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
```


### Output Block: 
The output block is used to define values that should be exposed after the Terraform execution, such as IP addresses, ARNs, etc. These values can be useful for other systems or scripts that need to interact with the provisioned infrastructure. Example:

```
output "instance_ip" {
  value = aws_instance.example.private_ip
}
```


### Module Block: 
The module block is used to encapsulate and reuse Terraform configurations. It allows you to abstract complex parts of your infrastructure into reusable modules that can be shared across projects. Example:

```
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
}
```

### Data Block: 
The data block is used to fetch and import existing data from the provider to use within the Terraform configuration. This could be information about existing resources, like AMIs, subnets, etc. Example:

```
data "aws_ami" "example" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["my-ami-*"]
  }
}
```



**For AWS**

```
### Terraform block: Terraform 0.13 and later

terraform {
  required_providers {

    aws = {
      source = "hashicorp/aws"
      version = "5.32.1"
    }

  }

}

### Provider block:
provider "aws" {
  region  = "us-east-1"
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_key = "YOUR_AWS_SECRET_KEY"
}

### Resource block:
resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3" 
  instance_type = "t2.micro"

  tags = {
    Name = "app_server"
  }

}
```


## Authentication: 

The AWS provider offers a flexible means of providing credentials for authentication. The following methods are supported, in this order, and explained below:

- Static credentials or Provider Configuration
- Environment variables
- Shared credentials file and Shared configuration files
- EC2 Role



### Static credentials or Provider Configuration:
Static credentials can be provided by adding an access_key and secret_key in-line in the AWS provider block:

```
provider "aws" {
  region     = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

### Shared Configuration and Credentials Files:
You can use an AWS credentials file to specify your credentials. The default location is $HOME/.aws/credentials on Linux and OS X, or "%USERPROFILE%\.aws\credentials" for Windows users.

If no named profile is specified, the "default" profile is used. Use the "profile" parameter or "AWS_PROFILE" environment variable to specify a named profile.


The locations of the shared configuration and credentials files can be configured using either the parameters shared_config_files and shared_credentials_files or the environment variables AWS_CONFIG_FILE and AWS_SHARED_CREDENTIALS_FILE.


### Default Profile:
```
aws configure

AWS Access Key ID [None]: test
AWS Secret Access Key [None]: test
Default region name [None]: us-east-1
Default output format [None]:
```

```
ll ~/.aws/

-rw------- 1 root root   29 Feb 10 01:18 config
-rw------- 1 root root   64 Feb 10 01:18 credentials
```

```
cat ~/.aws/config

[default]
region = us-east-1
```

```
cat ~/.aws/credentials

[default]
aws_access_key_id = test
aws_secret_access_key = test
```


### Custom AWS Profile:
```
aws configure --profile aws_dev

AWS Access Key ID [None]: test
AWS Secret Access Key [None]: test
Default region name [None]: us-east-2
Default output format [None]:
```


```
ll ~/.aws/

-rw------- 1 root root   37 Feb 10 01:21 config
-rw------- 1 root root   64 Feb 10 01:21 credentials
```


```
cat ~/.aws/config

[profile aws_dev]
region = us-east-2
```


```
cat ~/.aws/credentials

[aws_dev]
aws_access_key_id = test
aws_secret_access_key = test
```


### Custom localstack profile:
```
aws configure --profile localstack

AWS Access Key ID [None]: test
AWS Secret Access Key [None]: test
Default region name [None]: us-east-1
Default output format [None]:
```

```
ll ~/.aws/

-rw------- 1 root root   40 Feb 10 01:23 config
-rw------- 1 root root   67 Feb 10 01:23 credentials
```


```
cat ~/.aws/config

[profile localstack]
region = us-east-1
```


```
cat ~/.aws/credentials

[localstack]
aws_access_key_id = test
aws_secret_access_key = test
```


```
### Provider block:

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "localstack"  # Change profile
}
```




## Variables:
Terraform has input and output variables, it is a key-value pair. Input variables are used as parameters to input values at run time to customize our deployments. Output variables are return values of a terraform module that can be used by other configurations.


### Primitive Types Variables:
- **string:** a sequence of characters representing some text, such as “hello”.
- **number:** a numeric value. The number type can represent both numbers like 15 and fractional 6.28318.
- **bool:** either true or false.


### Complex Types Variables:
- **list:** A Terraform list variable is a sequence of similar values indexed by numbers (starting with 0). It accepts any type of value as long as they are all of the same types. Lists can be defined either implicitly or explicitly.
- **map:** A map is a collection of values where each value is identified by a string label.
- **object:** An object is a structural type that can contain different types of values, unlike map, list. It is a collection of named attributes that each have their own type.


## Terraform Input Variables:
Terraform input variables are used as parameters to input values at run time to customize our deployments. Input terraform variables can be defined in the main.tf configuration file but it is a best practice to define them in a separate "variables.tf" file to provide better readability and organization. 

A variable is defined by using a "variable" block with a label. The label is the name of the variable and must be unique among all the variables in the same configuration.

The variable declaration can optionally include three arguments:

- **type:** specifies the type of value such as string, number, bool, map, list, etc.
- **description:** briefly explain the purpose of the variable and what kind of value is expected.
- **default:** If present, the variable is considered to be optional and if no value is set, the default value is used.



**Syntax:**

```
variable "variable_name" {
  type        = "variable_type"
  description = "variable_description"
  default     = "default_value"
}
```


```
## For CLI Syntax:

terraform plan -var variable_name="value"
terraform plan -var-file="file_name.tfvars"
```


**Example:**

Here, create a new file called "variables.tf" with a block defining a new "instance_tag" variable.

```
variable "instance_tag" {
  type        = string
  description = "EC2 instance tagging"
  default     = "web_server"
}
```


```
resource "aws_instance" "app_server" {
   ami           = "ami-08d70e59c07c61a3a"
   instance_type = "t2.micro"
   
   tags = {
    Name = var.instance_tag
   }
}
```


### 1.String Variables

```
#vairables.tf

variable "instance_type" {
  type        = string
  description = "Instance type for EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "Ubuntu AMI ID"
  default     = "ami-0d26eb3972b7f8c96"
}
```


```
#main.tf

resource "aws_instance" "web_server" {
  instance_type = var.instance_type
  ami           = var.ami_id

  tags = {
    Name = "web_server"
  }
}
```


```
terraform plan
terraform plan -var instance_type="t2.large"
```


### 2.Number Variables

```
#vairables.tf

variable "instance_count" {
  type    = number
  default = 4
}
```


```
#main.tf

resource "aws_instance" "web_server" {
  instance_type = "t2.micro"
  ami           = "ami-12345678"
  count         = var.instance_count

  tags = {
    Name = "web-instance-${count.index + 1}"
  }
}
```


### 3.Boolean Variables

```
#vairables.tf

variable "var_bool" {
  type        = bool 
  default     = true
}

output "test" {
  value = var.var_bool ? "True" : "False"
}
```


```
Outputs:

+ test = "True"
```


```
#vairables.tf

variable "enable_feature" {
  type    = bool
  default = true #(false or true)
}
```


```
#main.tf

resource "aws_instance" "web_server" {
  instance_type = "t2.micro"
  ami           = "ami-12345678"
  count = var.enable_feature ? 1 : 0
}
```


### 4.List Variables:

```
#vairables.tf

variable "instance_types" {
  type    = list
  default = ["t2.micro", "t2.small", "t2.medium"]
}
```


```
#main.tf

resource "aws_instance" "example" {
  count         = length(var.instance_types)
  #instance_type = var.instance_types[0]  #Read the specific value
  instance_type = var.instance_types[count.index]
  ami           = "ami-12345678"
  
  # Other configuration for instances...
}
```



### 5.Map Variables:

**Syntax:**
```
variable "plans" {
  type = map

  default = {
    key1 = "value1"
    key2 = "value2"
	  key3 = "value3"
  }
}


plan = var.plans["key1"]  #Read the specific value
```


```
variable "instance_sizes" {
    type = map

    default = {
      small = "t3.micro"
      medium = "m4.large"
      large = "m4.xlarge"
    }
}
```


```
#vairables.tf

variable "web_instance" {
  type = map

  default 	= {
    dev = "t2.micro"
    prod = "t2.small"
    ami_id = "ami-12345678"
  }
}
```


```
#main.tf

resource "aws_instance" "web_server" {
  instance_type = var.web_instance["dev"]
  ami           = var.web_instance["ami_id"]

  tags = {
    Name = "web_server"
  }
}
```



### 6.Object Variables:

A collection of values each with their own type.

```
#vairables.tf

variable "user" {
 type      = object({
   name    = string
   age     = number
   enabled = bool
 })
  
default = {
   name    = "John Doe"
   age     = 30
   enabled = true
 }

}


#main.tf

resource "example_resource" "my_resource" {
  name    = var.user.name
  age     = var.user.age
  enabled = var.user.enabled
}
```


```
#vairables.tf

variable "instance_config" {
  description = "Configuration for the EC2 instance"
  
  type = object({
    instance_type = string
    ami_id  = string
    key_name  = string
  })

  default = {
    instance_type = "t2.micro"
    ami_id  = "ami-0c94855ba95c574c8"
    key_name  = "my_key_pair"
  }
}
```


```
#main.tf

resource "aws_instance" "app_server" {
  instance_type = var.instance_config.instance_type
  ami  = var.instance_config.ami_id 
  key_name  = var.instance_config.key_name

  tags = {
    Name = "web_server"
  }
}
```


### 7.Tuple:

A tuple is a fixed-length collection that can contain values of different data types. The key difference between tuples and lists are:

- Tuples have a fixed length, whereas lists do not.
- With tuples, it is possible to include values with different primitive types. Whereas lists necessitate type for all the elements included in it.
- Values included in tuples are specific ordered. Lists due to their dynamic sizes, it is possible to resize as well as reorder the values in them.
- A sequence of values each with their own type.


```
variable "employee" {
 description = "This is a variable of type tuple"

 type        = tuple([
   string,  #name
   number,  #age 
   bool     #active 
  ])
   
 default = [
   "Alice", 
   42, 
   true
  ]
}

resource "example_resource" "my_resource" {
  name   = var.employee[0]
  age    = var.employee[1]
  active = var.employee[2]
}
```


```
#vairables.tf

variable "ec2_instance" {
 description = "This is a variable of type tuple"

 type = tuple([
   string,  
   string,   
   string      
  ])
   
 default = [
   "t2.micro", 
   "ami-123456", 
   "web-app"
  ]

}
```


```
#main.tf

resource "aws_instance" "example" {
  instance_type = var.ec2_instance[0]
  ami           = var.ec2_instance[1]

  tags = {
    Name = var.ec2_instance[2]
  }

}
```




### 8.Set:

A set is an unordered collection of distinct values, meaning each element appears only once within the set. As against lists, sets enforce uniqueness – each element can appear only once within the set. Sets support various inbuilt operations such as union, intersection, and difference, which are used to combine or compare sets.

```
variable "set_example" {
 description = "This is a variable of type set"
 type        = set(string)
 default     = ["item1", "item2", "item3"]
}

output "set_element" {
  value = var.set_example
}
```


```
variable "var_set_string" {
  type    = set(string)
  default = ["item1", "item2"]
}

variable "var_set_any" {
  type    = set(any)
  default = ["item", 1]
}


output "set_string" {
  value = var.var_set_string
}

output "set_any" {
  value = var.var_set_any
}
```




### 9.Terraform for_each:

Terraform for_each is a meta argument that helps in creating multiple instances of a defined resource. It also provides us with the flexibility of dynamically setting the attributes of each resource instance created, depending on the type of variables being used to create real-world replicas.

**for_each** primarily works with a set of strings **(set(string))** and map of strings **(map(string))**.

When for_each meta-argument is used in a resource block, a special object each is automatically available to refer to each instance created by the for_each. **Each object is used to refer to the values provided in set, and key and value pairs provided in a map type variable.**


Finally, the each object is used to assign a Name tag for each resource instance created by this. If the “var.instances” is of set type, then “each.value” is the only available property. 
Else in case of map, it is possible to retrieve both key and value by using each.key and each.value.


```
resource "<resource type>" "<resource name>" {
  for_each = var.variable_name

  // Other attributes

  tags = {
    Name = each.value/key
  }

}
```


```
### For a set, each.value and each.key is the same:

#vairables.tf

variable "set_instance" {
  type = set(string)
  default = ["dev", "prod"]
}


#main.tf

resource "aws_instance" "by_set" {
  for_each = var.set_instance

  instance_type = "t2.micro"
  ami = "ami-0b08bfc6ff7069aff"

  tags = {
    Name = each.value  #Or (Any one: value or key)
    #Name = each.key
  }
}
```



```
### For a map, it is the map’s key, e.g. {map_key: “map_value” }

#vairables.tf

variable "map_instance" {
  type = map(string)

  default = {
    "instance_1" = "dev",
    "instance_2" = "prod"
  }
}


#main.tf

resource "aws_instance" "by_map" {
  for_each = var.map_instance

  ami = "ami-0b08bfc6ff7069a78"
  instance_type = "t2.micro"

  tags = {
    Name = each.value  #Used any one (value or key)  or Both
    ID = each.key
  }
}
```



### For_each with dynamic blocks:

In terraform, dynamic blocks are commonly used to construct repetitive nested blocks without duplicating code. The for_each meta-argument is commonly used in a dynamic block to achieve the desired result. 

A dynamic block in the resource block can dynamically construct repeatable **ingress** blocks using for_each. In a dynamic block, the name of the block (e.g., **ingress** in the example above) is used instead of **each**. So, using for_each with a dynamic block, you can easily create multiple nested blocks.

See the code snippet below:

```
locals {
    inbound_ports = [22, 80, 443]

}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.web_vpc.id
  description = "Allow SSH, HTTP, HTTPS inbound traffic"
  name   = "web_sg"

   dynamic "ingress" {
    for_each = local.inbound_ports
    #for_each = var.ingress_ports

    content {
      description = "Allows ingress for port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}
```



### 10.List of objects:

```
variable "list_of_objects" {
  type = list(object({
    name = string,
    cidr = string
  }))
  
  default = [
    {
      name = "Subnet A",
      cidr = "10.10.1.0/24"
    },

    {
      name = "Subnet B",
      cidr = "10.10.2.0/24"
    },

    {
      name = "Subnet C",
      cidr = "10.10.3.0/24"
    }
  ]

}
```


```
#vairables.tf

variable "sandboxes" {
  description = "Different type of sanbox instance"
  
  type = list(object({
    instance_type = string
    ami           = string
    name          = string
  }))

  default = [
    {
      instance_type = "t2.small"
      ami           = "ami-123456"
      name          = "sandbox_1"
    },

    {
      instance_type = "t2.micro"
      ami           = "ami-1234567"
      name          = "sandbox_2"
    },

    {
      instance_type = "t2.nano"
      ami           = "ami-12345678"
      name          = "sandbox_3"
    }
  ]

}
```


```
#main.tf

resource "aws_instance" "example" {
  for_each = { for sanbox in var.sandboxes : sanbox.name => sanbox }

  instance_type = each.value.instance_type
  ami           = each.value.ami

  tags = {
    Name = each.value.name
  }

}
```



### 11.Map of objects:

**Syntax:**
```
variable "map_of_objects" {
  description = "This is a variable of type Map of objects"

  type = map(object({
    name = string
    cidr = string
  }))
  
  default = {
    key1 = {
      name = "Subnet A"
      cidr = "10.10.1.0/24"
    }
	
    key2 = {
      name = "Subnet B"
      cidr = "10.10.2.0/24"
    }
	
    key3 = {
      name = "Subnet C"
      cidr = "10.10.3.0/24"
    }
	
  }
}
```



```
variable "map_of_objects" {
  description = "This is a variable of type Map of objects"
  
  type = map(object({
    name = string
    cidr = string
  }))
  
  default = {
    "subnet_a" = {
      name = "Subnet A"
      cidr = "10.10.1.0/24"
    }
    
    "subnet_b" = {
      name = "Subnet B"
      cidr = "10.10.2.0/24"
    }

    "subnet_c" = {
      name = "Subnet C"
      cidr = "10.10.3.0/24"
    }

  }
}
```



```
#vairables.tf

variable "instance_sizes" {
  description = "Configuration for different instance types"

  type = map(object({
    instance_type = string
    ami           = string
    subnet_id     = string
    key_name      = string
    tag_name      = string
  }))

  default = {
    "t2.micro" = {
      instance_type = "t2.micro"
      ami           = "ami-12345678"
      subnet_id     = "subnet-12345678"
      key_name      = "my-keypair"
      tag_name      = "dev"
    }

    "t2.small" = {
      instance_type = "t2.small"
      ami           = "ami-23456789"
      subnet_id     = "subnet-23456789"
      key_name      = "my-keypair"
      tag_name      = "prod"
    }

  }
}
```


```
#main.tf

resource "aws_instance" "web_server" {
  for_each = var.instance_sizes

  instance_type = var.instance_sizes[each.key].instance_type
  ami           = var.instance_sizes[each.key].ami
  subnet_id     = var.instance_sizes[each.key].subnet_id
  key_name      = var.instance_sizes[each.key].key_name

  # Other configuration for instances...

    tags = {
      tag_name = var.instance_sizes[each.key].tag_name
    }

}


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
```




### 12.Local variables:

Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration, but if overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.

Local values are created by a locals block (plural), but you reference them as attributes on an object named local (singular). Make sure to leave off the "s" when referencing a local value!


To refer to these variables in our main.tf file, use the syntax **local.declared_name** at appropriate places.

Local values are like a function's temporary local variables.


```
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
```


```

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
```


```
locals {
 server_names=["backend-dev-a", "backend-dev-b", "backend-dev-c"]
}

variable "instance_type" {
  type	= string
  default = "t2.micro"
}

resource "aws_instance" "backend_server" {
 ami           = "ami-07355fe79b493752d"
 instance_type = var.instance_type

 count         = var.instance_type == "t2.micro" ? 3 : 1

 tags          = {
   Name = local.server_names[count.index]
 }

}
```



## 13.Variable Definitions (.tfvars) Files:
To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either **.tfvars** or **.tfvars.json**) and then specify that file on the command line with **-var-file="file_name.tfvars"**


Do not confuse **"terraform.tfvars"** files with **"variables.tf"** files. Both are completely different and serve different purposes.

- variables.tf: are files where all variables are declared; these might or might not have a default value.
- terraform.tfvars: are files where the variables are provided/assigned a value.

In Terraform, terraform.tfvars is a file used to store input variables and their values. These variables can then be used within your Terraform configurations. This file follows the same syntax as the variable blocks within Terraform configuration files.

When you run terraform apply or terraform plan, Terraform automatically loads variables from files named either terraform.tfvars or any files with a .auto.tfvars suffix in the working directory. These variables override default values specified in variable blocks within the configuration files.

Here's an example of what a terraform.tfvars file might look like:

```
#vairables.tf

variable "vpc_cidr_block" {
  type        = string
  description = "cidr for web_vpc"
}
```


```
#terraform.tfvars

vpc_cidr_block = "10.0.0.0/16"
```


```
#main.tf

resource "aws_vpc" "web_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    name = "web_vpc"
  }
}
```





---
---




## Terraform Output Variables:
Terraform output variables are a way to extract information from your infrastructure after it's been created or modified by Terraform. Output variables allow you to conveniently display information such as IP addresses, DNS names, or other values of interest after Terraform has applied your configuration.


```
#vairables.tf

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "ami" {
  type        = string
  description = "cidr for web_vpc"
  default = "EC2 instance machine image"
}
```


```
#main.tf

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}
```


```
# outputs.tf

output "instance_type" {
  value = var.instance_type
}

output "ami" {
  value = var.ami
}

output "instance_id" {
 value       = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}
```


```
Outputs:

ami = "EC2 instance machine image"
instance_id = "i-e289c23700ad9f32a"
instance_type = "t2.micro"
private_ip = "10.x.x.x"
public_ip = "x.x.x.x"
```







## Links:
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform GCP Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- [Terraform Kubernetes Provider](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs)
- [Terraform Variables](https://spacelift.io/blog/how-to-use-terraform-variables)
- [Terraform Count](https://spacelift.io/blog/terraform-count)
- [Terraform for_each](https://kodekloud.com/blog/terraform-for_each/)
- [Terraform Dynamic Block](https://kodekloud.com/blog/terraform-dynamic-block/)
- [Terraform Locals](https://spacelift.io/blog/terraform-locals)
- [Terraform Lookup](https://spacelift.io/blog/terraform-lookup)




Overall, Terraform simplifies the process of managing infrastructure by providing a consistent and predictable way to provision and manage resources across different cloud providers and services.








