provider "aws"{
    region = "ap-south-1"
}

variable "ami"{
    description = "The AMI ID to use for the instance"
    
}

variable "instance_type" {
  description = "This is the instance type"
}


resource "aws_instance" "Ec2_instance" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = "subnet-0a282c986435216ed"
    tags = {
        Name = "MyEC2Instance"
    }
}