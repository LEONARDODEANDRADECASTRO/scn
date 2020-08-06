
# PROVIDER
provider "aws" {
  version                 = "~> 3.0"
  shared_credentials_file = var.shared_credentials_file
  profile                 = "default"
  region                  = var.region
}

# VPC Default
data "aws_vpc" "default" {
  id = "vpc-ac435fd6"
}



