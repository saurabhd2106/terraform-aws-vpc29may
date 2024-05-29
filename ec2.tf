
resource "aws_instance" "ec2_instances" {

  for_each = var.ec2_instances

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  availability_zone           = each.value.availability_zone
  
  vpc_security_group_ids      = [lookup(local.sg, each.value.security_group)]
  subnet_id                   = aws_subnet.subnets[each.value.subnet].id
  
  associate_public_ip_address = each.value.associate_public_ip_address
  user_data                   = each.value.user_data

  tags = {
    Name = each.key
  }


}

locals {
  
  sg = {
    public_sg = aws_security_group.public_sg.id

    private_sg = aws_security_group.private_sg.id
  }

}


