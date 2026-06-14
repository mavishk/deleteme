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

#create a datasource to get the latest Amazon Linux 2 AMI ID in the ap-south-1 region
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}
#using datasource to read the latest Amazon Linux 2 AMI ID and create an EC2 instance in the ap-south-1 region
resource "aws_instance" "my_second_ec2" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

