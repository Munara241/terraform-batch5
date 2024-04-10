provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.type
}

variable ami_id {
    description = "provide ami id"
    default = ""
    type = string 
}

variable type {
    description = "provide instance type"
    default = ""
    type = string
}

variable region {
    description = "provide region"
    default = ""
    type = string
}


