terraform {
  
  cloud {
    organization = "tenbucker"
    workspaces {
      name = "Terraform-tgw-spoke"
    }
  }
  

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4.0"
    }
  }
  required_version = ">= 1.1.0"
}
