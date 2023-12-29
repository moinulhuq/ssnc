variable "eks_cluster" {
  type    = string
}

variable "eks_node_group_name" {
  type    = string
}

variable "subnet_ids" {
  type    = list
}

variable "eks_capacity_type" {
  type    = string
}

variable "eks_disk_size" {
  type    = string
}

variable "eks_instance_types" {
  type    = string
}

variable "scaling_desired_size" {
  type    = number
}

variable "scaling_max_size" {
  type    = number
}


variable "scaling_min_size" {
  type    = number
}

variable "scaling_max_unavailable" {
  type    = number
}

variable "instance_key_pair" {
  type    = any
}

variable "allow_tls_eks" {
  type    = any
}
