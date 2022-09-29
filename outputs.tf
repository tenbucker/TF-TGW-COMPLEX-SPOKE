output "vpc_id" {
  description = "vpc id"
  value       = module.vpc.vpc_id
  
}

output "subnet_id" {
  description = "subnet id"
  value       = module.vpc.public_subnets
  
}

#output "transit_gateway_vpc_attachment" {
#  description = "tgw-attach-id"
#  value       = module.TGW.transit_gateway_vpc_attachment
#  
#}

#output "transit_gateway_route_table" {
#  description = "tgw-attach-id"
#  value       = module.TGW.transit_gateway_route_table
#  
#}
