provider "aws" {
  region = "eu-west-1" 
}


resource "aws_instance" "amazon_linux_for_exam" {
  ami                    = "ami-096f43ef67d75e998"                  # Amazon Linux Server
  instance_type          = "t2.micro"                                # Free tier
  vpc_security_group_ids = [aws_security_group.server_app_sg.id] # Возьмет ID security group у созданной группы
  key_name               = "ireland_key"

  tags = {
    Name  = "Amazon-Linux"
    Owner = "Alexander Efimov"
  }
}


resource "aws_security_group" "server_app_sg" {
  name = "server_app_calc_security_group"

  ingress {
    description = "open 80 port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "open 22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
