resource "aws_vpc" "VPC-1" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "My-VPC"
    }
}

resource "aws_subnet" "pub-subnet" {
    vpc_id = aws_vpc.VPC-1.id
    availability_zone = "us-west-2a"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name = "sub-1"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id =   aws_vpc.VPC-1.id
    tags = {
        Name = "igw"
    }
}

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.VPC-1.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "pub-route-table"
    }
  
}

resource "aws_route_table_association" "rt-association" {
    subnet_id = aws_subnet.pub-subnet.id
    route_table_id = aws_route_table.pub-rt.id
}

resource "aws_security_group" "name" {
    vpc_id = aws_vpc.VPC-1.id 
    description = "allow"
    name = "pub-sg"
    ingress {
       description = "allow"
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = [aws_vpc.VPC-1.cidr_block] 
    }
     ingress {
       description = "allow http"
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = [aws_vpc.VPC-1.cidr_block] 
    }
     egress{
        description = "allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
     }
}

resource "aws_instance" "ec2" {
    ami = "ami-0c766c2cff1b35ed2"
    instance_type = "t3.micro" 
    subnet_id = aws_subnet.pub-subnet.id
    tags = {
        Name = "server-1"
    }
}