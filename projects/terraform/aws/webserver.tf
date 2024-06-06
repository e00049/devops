# access, secret keys and region are configured as environment variables

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.43.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"  # Specify your desired AWS region here
}


# Create VPC 
resource "aws_vpc" "demo-vpc" {
  cidr_block           = "192.168.1.0/24"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
#   enable_classiclink   = "false"

  tags = {
    Name = "demo-vpc"
    env  = "dev"
  }
}

# Create Internet-GateWay
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name = "demo-vpc"
    env  = "dev"
  }
}

# Public Subnet  
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.demo-vpc.id
  cidr_block              = "192.168.1.0/26"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2a"

  tags = {
    Name = "public-subnet"
    env  = "dev"
  }
}

# Public Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

# Route Table and subnet Association 
resource "aws_route_table_association" "public-rt-subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

# Create Security Group for SSH and HTTP 
resource "aws_security_group" "webserver-sg" {
  name        = "webserver-sg"
  description = "allow all traffic"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress {
    description = "SSH protocol"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP protocol"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "webserver-sg"
  }
}

# Create EC2 Instance 
resource "aws_instance" "webserver" {
  ami                    = "ami-0f7197c592205b389"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-subnet.id
  key_name               = "e00049-workspace-machines"
  user_data              = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]

  root_block_device {
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = {
    Name = "linux-webserver"
    env  = "dev"
  }
}
