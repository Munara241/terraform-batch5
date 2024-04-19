provider "aws" {
    region = "us-east-2"
}

# public module
# custom module
module "vpc" {
    source = "Munara241/vpcbatch5/aws"
    version = "0.0.4"
    region = "us-east-2"
    vpc_cidr = "10.0.0.0/16"
    subnet1_cidr = "10.0.1.0/24"
    subnet2_cidr = "10.0.2.0/24"
    subnet3_cidr = "10.0.3.0/24"
    ip_on_launch = true
    instance_type = "t2.micro"
    subnet1_name = "hello1"
    subnet2_name = "hello2"
    subnet3_name = "hello3"
    ports = [
        { from_port = 22, to_port = 22 },
        { from_port = 80, to_port = 80 },
        { from_port = 443, to_port = 443 },
        { from_port = 82, to_port = 82 },
        { from_port = 81, to_port = 81 }

]


}