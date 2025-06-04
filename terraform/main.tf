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
}

module "s3_bucket" {
    source = "./modules/s3"
    bucket_name = "test-devops1211"
  

}

