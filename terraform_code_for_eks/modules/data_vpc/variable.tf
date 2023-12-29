
variable "vpc_name" {
  type    = string
}

variable "public_subnet_1_tag" {
  type    = string
  default =  "public-subnet-1"
}

variable "public_subnet_2_tag" {
  type    = string
  default = "public-subnet-2"
}

variable "private_subnet_1_tag" {
  type    = string
  default = "private-subnet-1"
}

variable "private_subnet_2_tag" {
  type    = string
  default = "private-subnet-2"
}

variable "instance_key_pair" {
  type    = any
  default = "instance_key_pair"
}

variable "allow_tls_eks" {
  type    = any
  default = "allow_tls_eks"
}

