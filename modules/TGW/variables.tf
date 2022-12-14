variable "transit_gateway_id" {
  description = "TGW ASN"
}
variable "vpc_id" {
  description = "vpc id"
  type = string
}

variable "subnet_ids" {
  description = "subnet ids"
  type = list(string)
}

variable "spokeRT" {
  description = "RT for TGW"
  type = string
}

variable "hubRT" {
  description = "RT for TGW"
  type = string
}


