variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t3.small"
}
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0e35ddab05955cf57"
}
variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "Hello Terraform"
}