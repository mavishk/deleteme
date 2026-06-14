terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}
# This provider is used to create resources in the ap-south-1 region(default)
provider "aws" {
  region = "ap-south-1"
}
# This provider is used to create resources in the us-west-2 region(needs alias)
# provider "aws" {
#   alias  = "us_west"
#   region = "us-west-2"
#}
# Create an S3 bucket in the ap-south-1 region
# resource "aws_s3_bucket" "bucket_ap_south" {
#   bucket = "my-bucket-ap-south-1-testing"
# }
# Create an S3 bucket in the us-west-2 region using the aliased provider
# resource "aws_s3_bucket" "bucket_us_west" {
#   provider = aws.us_west
#   bucket   = "my-bucket-us-west-2-testing" 
# }

# create an ec2 instance in the ap-south-1 region
resource "aws_instance" "ec2_ap_south" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}



