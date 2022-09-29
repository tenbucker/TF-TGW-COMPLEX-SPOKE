
variable "region" {
  default     = "us-east-2"
  description = "The AWS region your resources will be deployed"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "learn-vpc"
}

variable "prefix" {
  description = "project prefix"
  type        = string
  default     = "playground-attach"
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24", "10.1.104.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "transit_gateway_id" {
  description = "TGW ID"
  default     = "tgw-046e6efa08346bcf0"
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
