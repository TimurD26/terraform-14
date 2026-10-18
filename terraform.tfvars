region        = "eu-west-1"
name_prefix   = "cmtr-nnngbc62"
project_tag   = "cmtr-nnngbc62"
vpc_cidr      = "10.10.0.0/16"
instance_type = "t3.micro"

subnets = {
  "public-a" = {
    cidr = "10.10.1.0/24"
    az   = "eu-west-1a"
  }
  "public-b" = {
    cidr = "10.10.3.0/24"
    az   = "eu-west-1b"
  }
  "public-c" = {
    cidr = "10.10.5.0/24"
    az   = "eu-west-1c"
  }
}

allowed_ip_range = ["18.153.146.156/32", "37.99.26.20/32"]
