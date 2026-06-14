variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "The name for the EC2 instance"
  type        = string
  default     = "labec2instance"
}