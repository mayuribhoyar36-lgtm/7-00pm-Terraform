resource "aws_instance" "target-instance" {
     ami = "ami-0c766c2cff1b35ed2"
     instance_type = "t3.micro"
     tags = {
         Name = "target-server"
     }
}     

resource "aws_s3_bucket" "bucket" {
    tags = {
      Name = "tcs-bucket-test"
    }
  
}