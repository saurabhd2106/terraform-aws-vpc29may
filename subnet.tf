
resource "aws_subnet" "subnets" {

  for_each = var.subnets

  vpc_id = aws_vpc.myVpc.id

  cidr_block = each.value.cidr_block

  availability_zone = each.value.availability_zone

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = each.key
  }

}