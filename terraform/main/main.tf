provider "aws" {
  shared_credentials_file = "aws-creds"
  region                  = "eu-central-1"
}

resource "aws_security_group" "security_group" {
  name = "iac_workshop_security_group"

  # SSH
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = "ami-0db9040eb3ab74509" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = "t2.micro"
  key_name               = "workshops_keypair"
  vpc_security_group_ids = [aws_security_group.security_group.id]


  tags = {
    Name = "My workshop ec2 instance"
  }
}
