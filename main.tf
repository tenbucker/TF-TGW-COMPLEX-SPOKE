provider "aws" {
  region = var.region

  default_tags {
    tags = {
      AWSplay = "playground"
    }
  }
}

data "aws_availability_zones" "available" {
  state = "available"

}

locals {
  prefix = "playground-attach"
}

  module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name = local.prefix
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = slice(var.vpc_private_subnets, 0, length(data.aws_availability_zones.available.names))
  public_subnets  = slice(var.vpc_public_subnets, 0, length(data.aws_availability_zones.available.names))

  enable_nat_gateway      = true
  single_nat_gateway = true

#  tags = var.vpc_tags
}

resource "aws_route" "rt" {
  route_table_id            = module.vpc.private_route_table_ids[0]
  destination_cidr_block    = "10.0.0.0/8"
  transit_gateway_id = var.transit_gateway_id
#  depends_on                = [aws_route_table.testing]
}

module "TGW" {
  source  = "./modules/TGW"
  subnet_ids         = module.vpc.private_subnets
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = module.vpc.vpc_id
}
module "EC2" {
  AZcount = length(data.aws_availability_zones.available.names)
  source  = "./modules/compute"
  vpc_id      = module.vpc.vpc_id
  subnet_id = module.vpc.private_subnets
  prefix = local.prefix

}

module "lb" {
  source = "./modules/lb"
  subnet_id  = module.vpc.public_subnets
  vpc_id      = module.vpc.vpc_id
  target_id        = module.EC2.private_ip
  prefix = local.prefix
}


