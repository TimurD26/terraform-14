module "network" {
  source      = "./modules/network"
  name_prefix = var.name_prefix
  project_tag = var.project_tag
  vpc_cidr    = var.vpc_cidr
  subnets     = var.subnets
}

module "network_security" {
  source           = "./modules/network_security"
  name_prefix      = var.name_prefix
  project_tag      = var.project_tag
  vpc_id           = module.network.vpc_id
  allowed_ip_range = var.allowed_ip_range
}

module "application" {
  source             = "./modules/application"
  name_prefix        = var.name_prefix
  project_tag        = var.project_tag
  instance_type      = var.instance_type
  subnet_ids         = module.network.public_subnet_ids
  ssh_sg_id          = module.network_security.ssh_sg_id
  private_http_sg_id = module.network_security.private_http_sg_id
  public_http_sg_id  = module.network_security.public_http_sg_id
  vpc_id             = module.network.vpc_id
}
