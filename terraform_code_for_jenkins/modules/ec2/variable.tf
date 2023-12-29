variable "vpc_security_group_ids" {
  type    = any
}

variable "vm_name" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "ami" {
  type    = string
}

variable "associate_public_ip_address" {
  type    = bool
}

variable "public_subnet" {
  type    = any
}

