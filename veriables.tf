variable "aws_region"{
  description ="The AWS region to create things in."
  default    ="us-east-2"
}

variable "key_name"{
  description ="SSH keys to connect to ec2 instance"
  default     ="new1"
}

variable "instance_type"{
  description ="instance type of ec2"
  default    ="t2.micro"
}

variable "security_group"{
  description ="Name of the security group"
  default     ="my-jenkins-security-group"
}

variable "tag_name"{
  description ="Tag name for ec2 instance"
  default   ="my-ec2-instance"
}

variable "ami_id"{
  description ="AMI for ubuntu ec2 instance"
type        = string
   ## "ami-0b9064170e32bde34"
  
  

}

