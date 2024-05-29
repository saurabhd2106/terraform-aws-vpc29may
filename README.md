# VPC Module in AWS

This is a VPC module below is an example to use the module

### Example usage 

```
module "vpc1" {


  source = "../vpc_module"

  cidr_block = "10.0.0.0/16"

  vpc_name = "vpc-saurabh-1"


  ami_image = "ami-07d9b9ddc6cd8dd30"

  instance_type = "t2.micro"

  subnets = {

    public_subnet = {

      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"

    }

    private_subnet = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1a"

    }



  }

  inbound_traffic = {
    allow_http = {

      description = "Http from Internet"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]


    }

    allow_ssh = {

      description = "TLS from Internet"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }


  }

  ec2_instances = {
    public_ec2 = {

      ami                         = "ami-07d9b9ddc6cd8dd30"
      instance_type               = "t2.micro"
      key_name                    = "myKey"
      availability_zone           = "us-east-1a"
      security_group              = "public_sg"
      subnet                      = "public_subnet"
      associate_public_ip_address = true
      user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Saurabhs public VM</h1></body></html>" > /var/www/html/index.html
        EOF

    }

    private_ec2 = {

      ami               = "ami-07d9b9ddc6cd8dd30"
      instance_type     = "t2.micro"
      key_name          = "myKey"
      availability_zone = "us-east-1b"
      security_group    = "private_sg"
      subnet            = "private_subnet"

      associate_public_ip_address = true
      user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Saurabhs public VM</h1></body></html>" > /var/www/html/index.html
        EOF


    }
  }

}

```