provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Support_Environment" {
  instance_type = "t2.micro"
  ami = "ami-0ff5003538b60d5ec"
  subnet_id = "subnet-0a282c986435216ed"
  tags = {
  Name = "dev-ec2"
  Env  = "dev"
}

}


resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-tf-balaji-bucket-2026-02"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
