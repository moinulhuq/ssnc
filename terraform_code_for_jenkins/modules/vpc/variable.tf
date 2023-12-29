variable "vpc_anme" {
  type    = string
}

variable "cidr_block" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = string
}

variable "public_subnets" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    tag_name = string
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    tag_name = string
  }))
}

variable "allow_tls_jenkins" {
  type = map(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
  }))
}

variable "allow_tls_eks" {
  type = map(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
  }))
}
