variable "eks_name" {
  type    = string
  default = "eks_cluster"
}

variable "eks_node_group_name" {
  type    = string
  default = "node_grp"
}

variable "eks_capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "eks_disk_size" {
  type    = string
  default = "20"
}

variable "eks_instance_types" {
  type    = string
  default = "t2.small"
}

variable "scaling_desired_size" {
  type    = number
  default = 2
}

variable "scaling_max_size" {
  type    = number
  default = 3
}


variable "scaling_min_size" {
  type    = number
  default = 1
}

variable "scaling_max_unavailable" {
  type    = number
  default = 1
}

variable "amazon_cloudwatch_namespace" {
  type    = string
  default = "amazon-cloudwatch"
}