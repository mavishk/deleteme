
output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.lab_ec2.id
}

output "public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.lab_ec2.public_ip
}

output "ami_used" {
  description = "AMI ID picked by data source"
  value       = data.aws_ami.latest_amazon_linux.id
}

output "ami_name" {
  description = "AMI name picked by data source"
  value       = data.aws_ami.latest_amazon_linux.name
}
