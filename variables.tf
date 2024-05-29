variable "cidr_block" {

  type = string

  description = "CIDR range for VPC"

}

variable "vpc_name" {

  type = string

}



variable "ami_image" {

  type = string

}

variable "instance_type" {

  type = string

  default = "t2.micro"

}

variable "subnets" {

  type = any
  
}

variable "inbound_traffic" {

  type = any
  
}

variable "ec2_instances" {

  type = any  
}