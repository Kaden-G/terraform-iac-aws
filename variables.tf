variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  default     = "10.0.2.0/24"
}
