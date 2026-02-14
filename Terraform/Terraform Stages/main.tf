provider "aws"{
    region = "ap-south-1"
}

variable "ami"{
    description = "The AMI ID to use for the instance"
    
}

variable "instance_type" {
  description = "This is the instance type"
}

module "ec2_instance" {
  source = "./Modules/ec2_instance/"
  ami = var.ami
  instance_type = var.instance_type
}