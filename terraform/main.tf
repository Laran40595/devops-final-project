terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "portfolio_vpc" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "portfolio-vpc"
  }
}


resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.portfolio_vpc.id

  tags = {
    Name = "portfolio-igw"
  }
}


resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.portfolio_vpc.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "portfolio-public-subnet"
  }
}


resource "aws_route_table" "public_route" {

  vpc_id = aws_vpc.portfolio_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "portfolio-public-route"
  }
}


resource "aws_route_table_association" "public_assoc" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_route.id
}



resource "aws_security_group" "portfolio_sg" {

  name = "portfolio-security-group"

  vpc_id = aws_vpc.portfolio_vpc.id


  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {

    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}



data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["137112412989"]

  filter {

    name = "name"

    values = ["al2023-ami-2023*-x86_64"]

  }

}



resource "aws_instance" "portfolio_server" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  subnet_id = aws_subnet.public_subnet.id

  key_name = "greatkey"


  vpc_security_group_ids = [
    aws_security_group.portfolio_sg.id
  ]


  tags = {

    Name = "Portfolio-Server"

  }

}



output "public_ip" {

  value = aws_instance.portfolio_server.public_ip

}
