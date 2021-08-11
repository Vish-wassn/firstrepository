variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-2"
}

variable "my_vpc1" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "p_subnet12" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}


variable "my_vpc_secure" 
  description = "security group"
  default = "my_vpcsecure"
}
variable "ami_id"{
  description = "ec2 instance "
   default     ="ami-0b9064170e32bde34"
}

variable "instance_type"{
  description ="instance type of ec2"
  default    ="t2.micro"
}
