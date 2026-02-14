provider "aws" {
     region = "ap-south-1"
   export AWS_ACCESS_KEY_ID="your-access-key"
   export AWS_SECRET_ACCESS_KEY="your-secret-key"

}

resource "aws_instance" "myfirstvm" {
  count = "10"
  ami = "ami-0861f4e788f5069dd"
  instance_type = "t2.micro"
  key_name = "terraformkey"
  tags = {
    Name = "Linuxserver"
          }
          
}