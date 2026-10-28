provider "aws" {
 region = "us-west-2" 
}

resource "aws_s3_bucket" "bucket-1" {
  bucket = "iam-practicepiutr-bucket"
  }
  
  resource "aws_s3_object" "object-1" {
    bucket = "iam-practicepiutr-bucket"
    key = "test.txt"
    source = "test.txt"
    source_hash = fileexists("test.txt")
    depends_on = [ aws_s3_bucket_versioning.bucket-versioning ]
  }

  resource "aws_s3_bucket_versioning" "bucket-versioning" {
    bucket = "iam-practicepiutr-bucket"
    versioning_configuration {
      status = "Enabled"
    }
    
  }

  resource "aws_s3_object" "object-2" {
    bucket = "iam-practicepiutr-bucket"
    key = "dev.txt"
    source = "dev.txt"
    source_hash = filemd5("dev.txt")
    depends_on = [ aws_s3_bucket_versioning.bucket-versioning ]
  }