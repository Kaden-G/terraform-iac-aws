// AWS Region to deploy resources
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

// VPC configuration
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

// Subnet configurations
variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  default     = "10.0.2.0/24"
}

// EC2 Instance configuration
variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-085ad6ae776d8f09c" # Replace with the latest Amazon Linux 2 AMI for your region
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
