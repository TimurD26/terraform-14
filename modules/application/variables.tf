variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
}

variable "project_tag" {
  description = "Project tag"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "ssh_sg_id" {
  description = "SSH security group ID"
  type        = string
}

variable "private_http_sg_id" {
  description = "Private HTTP security group ID"
  type        = string
}

variable "public_http_sg_id" {
  description = "Public HTTP security group ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}