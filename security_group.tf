resource "aws_security_group" "public_sg" {

  vpc_id = aws_vpc.myVpc.id

  name = "public_sg"

dynamic "ingress" {

  for_each = var.inbound_traffic

  content {
    
    description = ingress.value.description
    from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks

  }
  
}


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }

}

resource "aws_security_group" "private_sg" {

  vpc_id = aws_vpc.myVpc.id

  name = "private_sg"

  ingress {
    description = "TLS from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.subnets["public_subnet"].cidr_block]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }

}