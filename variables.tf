variable "region" {
  description = "AWS region"
  type        = string
}

variable "name_prefix" {
  description = "Name prefix for all resources"
  type        = string
}

variable "project_tag" {
  description = "Project tag for resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of public subnets with CIDR and AZ"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "allowed_ip_range" {
  description = "List of allowed IP CIDR ranges for SSH and HTTP access"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
