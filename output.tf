output "public_ip" {

 #   value = aws_instance.ec2_instances["public_ec2"].public_ip

    value = [for instance in aws_instance.ec2_instances : instance.public_ip]
  
}