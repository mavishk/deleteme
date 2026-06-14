output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2_ap_south.id
}
output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2_ap_south.public_ip
}
output "ec2_instance_ami_id" {
  description = "The AMI ID used to create the EC2 instance"
  value       = aws_instance.ec2_ap_south.ami
}
output "ami_used_for_second_ec2" {
  description = "The AMI ID used to create the second EC2 instance"
  value       = data.aws_ami.latest_amazon_linux.id
}

output "ami_name" {
  description = "AMI name"
  value       = data.aws_ami.latest_amazon_linux.name
}

