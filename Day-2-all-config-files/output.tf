output "vpc_id" {
  value = aws_vpc.VPC-1.id
}

output "vpc_region" {
  value = aws_vpc.VPC-1.region
}

output "subnet_id" {
  value = aws_subnet.sub-1.id
}

output "subnet_az" {
  value = aws_subnet.sub-1.availability_zone
}