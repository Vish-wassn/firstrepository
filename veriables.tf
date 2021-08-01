variable "aws_region"{
  description ="The AWS region to create things in."
  region     ="us-east-2"
}

variable "key_name"{
  description ="SSH keys to connect to ec2 instance"
  key_name    ="new1"
}

variable "instance_type"{
  description ="instance type of ec2"
  instance_type    ="t2.micro"
}

variable "security_group"{
  description ="Name of the security group"
  security_groups     ="security_jenkins_grp"
}

variable "tag_name"{
  description ="Tag name for ec2 instance"
  tags   ="my-ec2-instance"
}

variable "ami_id"{
  description ="AMI for ubuntu ec2 instance"
   ami      ="ami-0b9064170e32bde34"
}
