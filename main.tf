module "TgwPeeringAttach" {
  source = "./Modules/TgwPeeringAttach"

  environment             = var.environment
  project_name            = var.project_name
  aws_region              = var.aws_region
  aws_region_local        = var.aws_region_local
  aws_region_peer         = var.aws_region_peer
  aws_profile             = var.aws_profile
  aws_account_id          = var.aws_account_id
  peer_account_id         = var.peer_account_id
  transit_gateway_id      = var.transit_gateway_id
  peer_transit_gateway_id = var.peer_transit_gateway_id
  account_name            = var.account_name
  account_name_dest       = var.account_name_dest
  name_ref_tgw            = var.name_ref_tgw
  name_ref_tgw_dest       = var.name_ref_tgw_dest
  name_region             = var.name_region
  name_region_dest        = var.name_region_dest
}