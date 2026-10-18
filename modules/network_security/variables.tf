variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
}

variable "project_tag" {
  description = "Project tag"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "allowed_ip_range" {
  description = "Allowed IP CIDR ranges"
  type        = list(string)
}
