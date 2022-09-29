variable "subnet_id" {
  description = "Private subnets for VPC"
  type        = list(string)
}

variable "vpc_id" {
  description = "id of VPC"
  type        = string
}

variable "AZcount" {
  description = "number of AZs"
  type        = number
}

variable "prefix" {
  description = "prefix for names"
  type        = string
}
