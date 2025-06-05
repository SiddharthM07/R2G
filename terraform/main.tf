provider "aws" {
  
  region = "ap-south-1"
  profile = "SiddharthM"
}

module "ec2_instance" {
  
  source = "./modules/ec2"
  ami_id = "ami-06b6e5225d1db5f46"
  instance_type = "t2.micro"
  count = var.create_ec2 ? 1:0
  instance_name = "devops_test"
  key_name = aws_key_pair.my_key.key_name
}

resource "aws_security_group" "allow_http_https_ssh" {
  name        = "allow_http_https_ssh"
  description = "Allow HTTP, HTTPS, and SSH traffic from anywhere"
  vpc_id      = var.vpc_id # Ensure you have VPC ID defined

  # Allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_https_ssh"
  }
}


  
module "s3_bucket" {
    source = "./modules/s3"
    bucket_name = "test-devops1211"
  

}



resource "aws_key_pair" "my_key" {
    key_name = "my_aws_key_new"
    public_key = file("~/.ssh/my-aws-key.pub")
  
}