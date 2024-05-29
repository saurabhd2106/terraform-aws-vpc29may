
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.myVpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myIg.id
  }


  tags = {
    Name = "public_route"
  }
}


resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.subnets["public_subnet"].id
  route_table_id = aws_route_table.public_route.id
}


resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.myVpc.id

  tags = {
    Name = "private_route"
  }
}


resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.subnets["private_subnet"].id
  route_table_id = aws_route_table.private_route.id
}
