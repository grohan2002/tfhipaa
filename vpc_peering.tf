resource "aws_vpc_peering_connection" "mgmt_to_dev" {
  vpc_id      = module.mgmt_vpc.vpc_id
  peer_vpc_id = module.dev_vpc.vpc_id
  auto_accept = true
}

resource "aws_vpc_peering_connection" "mgmt_to_staging" {
  vpc_id      = module.mgmt_vpc.vpc_id
  peer_vpc_id = module.staging_vpc.vpc_id
  auto_accept = true
}

resource "aws_vpc_peering_connection" "mgmt_to_prod" {
  vpc_id      = module.mgmt_vpc.vpc_id
  peer_vpc_id = module.prod_vpc.vpc_id
  auto_accept = true
}