# Terraform Block
terraform {
  required_version = "~> 1.1.2" 
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  } 
}  
# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
#resource Block
resource "random_pet" "this" {
  length = 2
}
