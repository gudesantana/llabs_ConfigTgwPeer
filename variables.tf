####################################
# Global Variables
####################################

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_region_local" {
  type = string
}

variable "aws_region_peer" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "account_name" {
  type = string
}

variable "name_region" {
  type = string
}

variable "account_name_dest" {
  type = string
}

variable "name_ref_tgw" {
  type = string
}

variable "name_ref_tgw_dest" {
  type = string
}

variable "name_region_dest" {
  type = string
}








####################################
# TGW peering
####################################

variable "transit_gateway_id" {
  type = string
}

variable "peer_transit_gateway_id" {
  type = string
}

variable "peer_account_id" {
  type = string
}