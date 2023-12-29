terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

locals {
  region = "ap-southeast-2"
}

# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = local.region
}

# Module aws vpc
module "vpc" {
  source                  = "./modules/vpc"
  vpc_anme                = var.vpc_anme
  cidr_block              = var.cidr_block
  public_subnets          = var.public_subnets
  private_subnets         = var.private_subnets
  allow_tls_jenkins       = var.allow_tls_jenkins
  allow_tls_eks           = var.allow_tls_eks
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

# Module aws ec2
module "ec2" {
  source                      = "./modules/ec2"
  ami                         = var.ami
  vm_name                     = var.vm_name
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  public_subnet               = module.vpc.public_subnet
  vpc_security_group_ids      = module.vpc.vpc_security_group_ids
}
