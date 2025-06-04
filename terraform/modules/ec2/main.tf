resource "aws_instance" "devops_test" {

    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
  
}