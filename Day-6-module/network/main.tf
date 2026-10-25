resource "aws_vpc" "VPC" {
  cidr_block = var.vpc_cidr
  tags = {
      Name = var.vpc_name
  }
}

resource "aws_subnet" "Subnet" {
   vpc_id = aws_vpc.VPC.id
   cidr_block = var.subnet_cidr
   tags = {
       Name = var.subnet_name
   }
}