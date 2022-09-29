variable "subnet_id" {
  description = "Private subnets for VPC"
  type        = list(string)
}

variable "vpc_id" {
  description = "id of VPC"
  type        = string
}


variable "target_id" {
  description = "list of EC2 IPs"
  type        = list(string)
}

variable "prefix" {
  description = "prefix for names"
  type        = string
}

