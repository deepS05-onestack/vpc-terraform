variable "region" {
  description = "AWS region to create resources in"
  type        = ap-south-1a
}

variable "tags" {
  description = "Tags to apply to created resources"
  type        = map(string)
}

# VPC A inputs
variable "vpc_a_name" {
  type = string
}

variable "vpc_a_vpc_cidr" {
  type = string
}

variable "vpc_a_backend_az" {
  type = string
}

variable "vpc_a_backend_subnet_cidr" {
  type = string
}

variable "vpc_a_db_az" {
  type = string
}

variable "vpc_a_db_subnet_cidr" {
  type = string
}

# VPC B inputs
variable "vpc_b_name" {
  type = string
}

variable "vpc_b_vpc_cidr" {
  type = string
}

variable "vpc_b_backend_az" {
  type = string
}

variable "vpc_b_backend_subnet_cidr" {
  type = string
}

variable "vpc_b_db_az" {
  type = string
}

variable "vpc_b_db_subnet_cidr" {
  type = string
}
