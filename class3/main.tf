provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = "subnet-01135709e6f79dea5"
  # availability_zone = "us-east-2a"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  # associate_public_ip_address = false # without public_ip create the instance 
  key_name = aws_key_pair.deployer.key_name
  count = 3
  user_data = file("apache.sh")
  user_data_replace_on_change = true
  tags = local.common_tags  # from file tag.tf we provide the path
}

output ec2 {
  value = aws_instance.web[*].public_ip  # print public_ids all instances

}