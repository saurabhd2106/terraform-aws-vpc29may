resource "aws_vpc" "myVpc" {

  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
    env = "dev"
  }

}