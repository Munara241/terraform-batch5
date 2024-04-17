provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "hello"
  public_key = file("~/.ssh/id_rsa.pub")
}

# create EC2
# resource "aws_instance" "web" {
#   ami                    = "ami-0900fe555666598a2"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   key_name               = aws_key_pair.deployer.key_name

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("~/.ssh/id_rsa")
#     host        = self.public_ip
#   }
#   provisioner "remote-exec" { # second provisioner is called "remote_exec"
#     inline = [
#       "mkdir kaizen",
#       "touch hello"
#     ]
#   }
# }

# resource "null_resource" "hello" { # we create in a black hole
#     provisioner "local-exec" { # Local exect provisiner
#     command = "mkdir kaizen && touch hello"
#    }


resource "aws_instance" "web" {
  ami                    = "ami-0900fe555666598a2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name               = aws_key_pair.deployer.key_name
}

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("~/.ssh/id_rsa")
#     host        = self.public_ip
#   }

# first way
#   provisioner "file" {          # third provisioner is called "file provisiner" 
#     source = "./httpd.sh"       # source is local machine
#     destination = "./httpd.sh"  # remote machine
#   }

#second way
#   provisioner "remote-exec" {
#     script = "./httpd.sh"  # execute the file httpd.sh remotly
#   }
# }