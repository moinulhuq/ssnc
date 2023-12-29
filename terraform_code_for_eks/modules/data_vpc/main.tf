
data "aws_vpc" "custom_vpc" {
   filter {
     name = "tag:Name"
     values = ["${var.vpc_name}"]
   }
}

data "aws_subnet" "public_subnet_1" {
  vpc_id = data.aws_vpc.custom_vpc.id
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_1_tag]
  }
}

data "aws_subnet" "public_subnet_2" {
  vpc_id = data.aws_vpc.custom_vpc.id
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_2_tag]
  }
}

data "aws_subnet" "private_subnet_1" {
  vpc_id = data.aws_vpc.custom_vpc.id
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_1_tag]
  }
}

data "aws_subnet" "private_subnet_2" {
  vpc_id = data.aws_vpc.custom_vpc.id
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_2_tag]
  }
}

data "aws_key_pair" "instance_key_pair" {
  filter {
    name   = "tag:Name"
    values = [var.instance_key_pair]
  }
}

data "aws_security_group" "allow_tls_eks" {
  filter {
    name   = "tag:Name"
    values = [var.allow_tls_eks]
  }
}

