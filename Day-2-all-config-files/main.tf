resource "aws_vpc" "VPC-1" {
  cidr_block = var.vpc_cidr
  tags = {
      Name = "my-vpc"
  }
}

resource "aws_subnet" "sub-1" {
    vpc_id = aws_vpc.VPC-1.id
    cidr_block = var.subnet_cidr
    tags = {
        Name = "my-subnet"
    }
  
}