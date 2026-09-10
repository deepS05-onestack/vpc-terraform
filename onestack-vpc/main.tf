module "vpc_a" {
  source  = "app.terraform.io/onestack/aws_vpc/aws"
  version = "1.0.1"

  vpc_name = var.vpc_a_name

  vpc_cidr = var.vpc_a_vpc_cidr

  backend_az          = var.vpc_a_backend_az
  backend_subnet_cidr = var.vpc_a_backend_subnet_cidr
  db_az               = var.vpc_a_db_az
  db_subnet_cidr      = var.vpc_a_db_subnet_cidr

  region = var.region
  tags   = merge(var.tags, { Name = var.vpc_a_name })
}

module "vpc_b" {
  source  = "app.terraform.io/onestack/aws_vpc/aws"
  version = "1.0.1"

  vpc_name = var.vpc_b_name

  vpc_cidr = var.vpc_b_vpc_cidr

  backend_az          = var.vpc_b_backend_az
  backend_subnet_cidr = var.vpc_b_backend_subnet_cidr
  db_az               = var.vpc_b_db_az
  db_subnet_cidr      = var.vpc_b_db_subnet_cidr

  region = var.region
  tags   = merge(var.tags, { Name = var.vpc_b_name })
}
