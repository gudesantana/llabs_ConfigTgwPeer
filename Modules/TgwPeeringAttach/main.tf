# terraform {
#   required_version = ">= 0.12"
# }

# # First accepts the Peering attachment.
# provider "aws" {
#   alias = "first"

#   region     = var.aws_first_region
#   access_key = var.aws_first_access_key
#   secret_key = var.aws_first_secret_key
# }

# # Second creates the Peering attachment.
# provider "aws" {
#   alias = "second"

#   region     = var.aws_second_region
#   access_key = var.aws_second_access_key
#   secret_key = var.aws_second_secret_key
# }

provider "aws" {
  alias  = "local"
  region = var.aws_region_local
}

provider "aws" {
  alias  = "peer"
  region = var.aws_region_peer
}

data "aws_caller_identity" "local" {
  provider = aws.local
}

data "aws_region" "peer" {
  provider = aws.peer
}

# resource "aws_ec2_transit_gateway" "local" {
#   provider = aws.local

#   tags = {
#     Name = "terraform-example"
#   }
# }

# resource "aws_ec2_transit_gateway" "peer" {
#   provider = aws.peer

#   tags = {
#     Name = "terraform-example"
#   }
# }

# Create the Peering attachment in the second account...
resource "aws_ec2_transit_gateway_peering_attachment" "this" {
  # provider = aws.peer

  peer_account_id         = var.peer_account_id
  peer_region             = data.aws_region.peer.name
  transit_gateway_id      = var.transit_gateway_id
  peer_transit_gateway_id = var.peer_transit_gateway_id
  
  tags = {
    Name = "tgw-peering-${var.account_name}-${var.name_ref_tgw}_${var.account_name_dest}-${var.name_ref_tgw_dest}-${var.project_name}"
    Side = "Creator"
  }
}

# # Aceitar somente uma vez na conta remota, após isso comentar o resource.
# resource "aws_ec2_transit_gateway_peering_attachment_accepter" "this" {
#   provider = aws.peer

#   transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.this.id
#   tags = {
#     Name = "tgw peering SP - Virginia"
#     Side = "Acceptor"
#   }
# }