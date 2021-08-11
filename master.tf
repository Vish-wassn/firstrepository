# creating our vpc.
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.my_vpc1
  instance_tenancy = "default"

  tags = {
    Name = "shash_vpc"
  }
}
# Create Public Subnet 1
resource "aws_subnet" "p_subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.p_subnet12
  availability_zone= "us-east-2a"

  tags = {
    Name = "p_subnet1"
  }
}

# Create Internet Gateway and Attach it to VPC
resource "aws_internet_gateway" "i-gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "shash_igw"
  }
}
# Create Route Table and Add Public Route
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.i-gw.id
  }

  tags       = {
    Name     = "p_Route Table"
  }
}
# Associate Public Subnet 1 to "Public Route Table"
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.p_subnet1.id
  route_table_id      = aws_route_table.public-route-table.id
}


resource "aws_security_group" "sh_security" {
  name        = var.my_vpc_secure
  vpc_id      = "${aws_vpc.my_vpc.id}"
description = "security group for ec2 instance"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 

  tags = {
    Name = var.my_vpc_secure
  }
}
# launching our ec2 in vpc
resource "aws_instance" "new_vpc_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
# in which subnet our ec2 should launch
  subnet_id="${aws_subnet.p_subnet1.id}"
  vpc_security_group_ids=["${aws_security_group.sh_security.id}"]
  tags = {
    Name = "new_vpc_ec2"
  }
}
