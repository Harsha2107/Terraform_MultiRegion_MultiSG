provider "aws" {
  region = "us-east-1"
  alias  = "usa"
}
provider "aws" {
  region = "ap-south-2"
  alias  = "hyd"
}
resource "aws_instance" "devops" {
  tags = {
    Name = "usa-instance"
  }
  provider               = aws.usa
  ami                    = "ami-09bf9dfeeb1e9adbc"
  instance_type          = "t3.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.usasg.id]
  root_block_device {
    volume_size = 10
  }
}
resource "aws_instance" "ind" {
  tags = {
    Name = "ind-instance"
  }
  provider               = aws.hyd
  ami                    = "ami-010fa53121fdf2e58"
  instance_type          = "t3.micro"
  availability_zone      = "ap-south-2a"
  key_name               = "Docker"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  root_block_device {
    volume_size = 10
  }
}
