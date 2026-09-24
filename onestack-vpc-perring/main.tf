data "aws_vpc" "requester" {
  id = var.requester_vpc_id
}

data "aws_route_tables" "requester" {
  vpc_id = data.aws_vpc.requester.id
}

data "aws_vpc" "accepter" {
  id = var.accepter_vpc_id
}

data "aws_route_tables" "accepter" {
  vpc_id = data.aws_vpc.accepter.id
}

module "vpc_peering" {
  source  = "app.terraform.io/onestack/aws_vpc_peering/aws"
  version = "1.0.0"

  requester_vpc_id          = data.aws_vpc.requester.id
  accepter_vpc_id           = data.aws_vpc.accepter.id
  requester_route_table_ids = data.aws_route_tables.requester.ids
  accepter_route_table_ids  = data.aws_route_tables.accepter.ids
  auto_accept_peering       = true
  peering_name              = "prod-card-vpc-peering"

  tags = {
    Project     = "onestack"
    Environment = "production"
  }
}

output "peering_connection_id" {
  value = module.vpc_peering.vpc_peering_connection_id
}