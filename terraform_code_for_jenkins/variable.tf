variable "vpc_anme" {
  type    = string
  default = "custom_vpc"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "map_public_ip_on_launch" {
  type    = string
  default = true
}

variable "public_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tag_name          = string
  }))
  default = {
    "public-subnet-1" = { cidr_block = "10.0.0.0/20", availability_zone = "ap-southeast-2a", tag_name = "public-subnet-1" }
    "public-subnet-2" = { cidr_block = "10.0.16.0/20", availability_zone = "ap-southeast-2b", tag_name = "public-subnet-2" }
  }
}

variable "private_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tag_name          = string
  }))
  default = {
    "private-subnet-1" = { cidr_block = "10.0.32.0/20", availability_zone = "ap-southeast-2a", tag_name = "private-subnet-1" }
    "private-subnet-2" = { cidr_block = "10.0.48.0/20", availability_zone = "ap-southeast-2b", tag_name = "private-subnet-2" }
  }
}

variable "allow_tls_jenkins" {
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
  default = {
    "post_8080" = { description = "Allow port 8080", from_port = 8080, to_port = 8080, protocol = "tcp" },
    "port_22"   = { description = "Allow port 22", from_port = 22, to_port = 22, protocol = "tcp" },
  }
}

variable "allow_tls_eks" {
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
  default = {
    "port_22" = { description = "Allow port 22", from_port = 22, to_port = 22, protocol = "tcp" },
  }
}

variable "vm_name" {
  type    = string
  default = "jenkins_server"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-09eebd0b9bd845bf1"
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}
