
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

locals {
  region   = "ap-southeast-2"
  vpc_name = "custom_vpc"
}

# Provider
provider "aws" {
  #profile = "default"
  region  = local.region
}

# Module aws vpc
module "data_vpc" {
  source   = "./modules/data_vpc"
  vpc_name = local.vpc_name
}

# Module eks master
module "eks_master" {
  source     = "./modules/eks_master"
  eks_name   = var.eks_name
  subnet_ids = [module.data_vpc.public_subnet_1.id, module.data_vpc.public_subnet_2.id]
}

# Module eks worker
module "eks_worker" {
  source                  = "./modules/eks_worker"
  eks_cluster             = module.eks_master.eks_cluster.name
  subnet_ids              = [module.data_vpc.private_subnet_1.id, module.data_vpc.private_subnet_2.id]
  eks_node_group_name     = var.eks_node_group_name
  eks_capacity_type       = var.eks_capacity_type
  eks_disk_size           = var.eks_disk_size
  eks_instance_types      = var.eks_instance_types
  scaling_desired_size    = var.scaling_desired_size
  scaling_max_size        = var.scaling_max_size
  scaling_min_size        = var.scaling_min_size
  scaling_max_unavailable = var.scaling_max_unavailable
  instance_key_pair       = module.data_vpc.instance_key_pair
  allow_tls_eks           = module.data_vpc.allow_tls_eks
}

data "aws_eks_cluster" "eks_cluster" {
  name = "eks_cluster"
  depends_on = [ module.eks_master ]
}

# eks monitoring and logging
module "eks_monitoring_logging" {
  source = "shamimice03/eks-monitoring-logging/aws"
  cluster_name = data.aws_eks_cluster.eks_cluster.name
  aws_region   = local.region
  namespace    = var.amazon_cloudwatch_namespace
  enable_cwagent    = true
  enable_fluent_bit = true
}

