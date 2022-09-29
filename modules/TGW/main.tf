#resource "aws_ec2_transit_gateway_route_table_association" "example" {
#  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.example.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.example.id
#  
#}
resource "aws_ec2_transit_gateway_vpc_attachment" "example" {
  subnet_ids         = var.subnet_ids
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.vpc_id
  transit_gateway_default_route_table_association = true
}

#resource "aws_ec2_transit_gateway_route_table" "example" {
#  transit_gateway_id = var.transit_gateway_id
#}

#resource "aws_ec2_transit_gateway_route_table_propagation" "example" {
#  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.example.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.example.id
#}

