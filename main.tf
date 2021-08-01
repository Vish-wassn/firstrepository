provider "aws"{
region = var.aws_region
}


resource "aws_security_group" "security_jenkins_grp" {
  name        = var.security_group
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = var.security_group
  }
}


resource "aws_instance" "myFirstInstance" {
  ami           = var.ami-0b9064170e32bde34
  key_name = var.new1
  instance_type = "t2.micro"
  security_groups= [ "security_jenkins_grp"]
  tags= {
    Name = "jenkins_instance"
  }

}


resource "aws_eip" "myFirstInstance" {
   vpc  =true
  COUNT =1
instance = aws_instance.myFirstInstance.id
 tags= {
    Name = "my_elastic_ip"
  }

}
