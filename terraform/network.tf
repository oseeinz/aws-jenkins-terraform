# Create a VPC
resource "aws_vpc" "TF_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "TF_vpc"
  }
}
#Add subnet public
resource "aws_subnet" "TFsub_pub" {
  vpc_id     = aws_vpc.TF_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "TFsub_pub"
  }
}

#Add subnet public 2
resource "aws_subnet" "TFsub_pub2" {
  vpc_id     = aws_vpc.TF_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"

  tags = {
    Name = "TFsub_pub2"
  }
}

#Add subnet Private
resource "aws_subnet" "TFsub_pv" {
  vpc_id     = aws_vpc.TF_vpc.id
  cidr_block = "10.0.21.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "TFsub_pv"
  }
}

#Add subnet Private 2
resource "aws_subnet" "TFsub_pv2" {
  vpc_id     = aws_vpc.TF_vpc.id
  cidr_block = "10.0.22.0/24"
  availability_zone = "us-east-1d"

  tags = {
    Name = "TFsub_pv2"
  }
}

#Add internet gateway
resource "aws_internet_gateway" "TF_ig" {
  vpc_id = aws_vpc.TF_vpc.id

  tags = {
    Name = "TF_ig"
  }
}
#Add route table
resource "aws_route_table" "TF_rt" {
  vpc_id = aws_vpc.TF_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.TF_ig.id
  }

  tags = {
    Name = "TF_rt"
  }
}

#Associate both public subnets (TFsub_pub and TFsub_pub2) with route table
resource "aws_route_table_association" "TF-pub-a" {
  subnet_id      = aws_subnet.TFsub_pub.id
  route_table_id = aws_route_table.TF_rt.id
}
resource "aws_route_table_association" "TF-pub-c" {
  subnet_id      = aws_subnet.TFsub_pub2.id
  route_table_id = aws_route_table.TF_rt.id
}

#Add Security group
resource "aws_security_group" "TF_sg" {
  name        = "TF_sg"
  description = "Allow only ssh and http inbound traffic"
  vpc_id      = aws_vpc.TF_vpc.id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    description = "App server GUI"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "TF_sg"
  }
}
