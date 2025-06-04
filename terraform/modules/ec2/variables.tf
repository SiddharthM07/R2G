variable "ami_id" {
  type = string
}

variable "instance_type" {
    type = string
  
}

variable "instance_name" {

    type = string
  
}

variable "create_ec2" {

    type = bool
    default = true
  
}