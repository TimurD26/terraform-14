variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
}

variable "project_tag" {
  description = "Project tag"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnets with CIDR and AZ"
  type = map(object({
    cidr = string
    az   = string
  }))
}
