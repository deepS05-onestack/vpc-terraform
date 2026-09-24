variable "requester_vpc_id" {
  type        = string
  description = "The ID of the requester VPC."
}

variable "accepter_vpc_id" {
  type        = string
  description = "The ID of the accepter VPC."
}

variable "accepter_owner_id" {
  type        = string
  default     = ""
  description = "The AWS account ID of the owner of the accepter VPC (required for cross-account peering)."
}

variable "accepter_region" {
  type        = string
  default     = ""
  description = "The region of the accepter VPC (required for cross-region peering)."
}

variable "auto_accept_peering" {
  type        = bool
  default     = true
  description = "Whether to auto-accept the peering request (only works when both VPCs are in the same account and region)."
}

variable "accept_peering" {
  type        = bool
  default     = false
  description = "Set to true to create an aws_vpc_peering_connection_accepter resource when auto_accept_peering is false."
}

variable "peering_name" {
  type        = string
  default     = " "
  description = "Optional custom Name tag for the VPC peering connection."
}

variable "manage_dns_options" {
  type        = bool
  default     = true
  description = "Whether to configure DNS resolution options for the VPC peering connection."
}

variable "requester_allow_remote_vpc_dns_resolution" {
  type        = bool
  default     = true
  description = "Allow requester VPC to resolve public/private DNS hostnames to private IP addresses of the accepter VPC."
}

variable "accepter_allow_remote_vpc_dns_resolution" {
  type        = bool
  default     = true
  description = "Allow accepter VPC to resolve public/private DNS hostnames to private IP addresses of the requester VPC."
}

variable "create_routes" {
  type        = bool
  default     = true
  description = "Whether to automatically add routes to route tables for VPC peering."
}

variable "requester_route_table_ids" {
  type        = list(string)
  default     = []
  description = "List of route table IDs in the requester VPC to route traffic to the accepter VPC."
}

variable "accepter_route_table_ids" {
  type        = list(string)
  default     = []
  description = "List of route table IDs in the accepter VPC to route traffic to the requester VPC."
}

variable "requester_destination_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "Destination CIDR blocks for requester route tables. If empty, auto-fetched from the accepter VPC."
}

variable "accepter_destination_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "Destination CIDR blocks for accepter route tables. If empty, auto-fetched from the requester VPC."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources."
}
