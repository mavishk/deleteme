provider "aws" {
  region = "ap-south-1"
}
#datasource to get the latest Amazon Linux 2 AMI ID in the ap-south-1 region
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners     = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# --- Resource: EC2 Instance ---
resource "aws_instance" "lab_ec2" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
