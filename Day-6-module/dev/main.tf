module "dev" {
    source = "../ec2"
    ami_id = "ami-0c766c2cff1b35ed2"
    instance_type = "t3.micro"
    name = "server-1"
}

module "vpc" {
    source = "../network"
    vpc_cidr = "10.0.0.0/16"
    vpc_name = "VPC-1"
    subnet_cidr = "10.0.0.0/24"
    subnet_name = "subnet-1"
}

