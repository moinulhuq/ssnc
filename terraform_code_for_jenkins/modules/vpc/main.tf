# VPC module
resource "aws_vpc" "custom_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_anme
  }
}

# Public subnet
resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = each.value.tag_name
  }
}

# Private subnet
resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnets
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = each.value.tag_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "igw"
  }
}

# Public Routetable
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

# Elastic IP
resource "aws_eip" "elastic_ip" {
  domain = "vpc"

  tags = {
    Name = "elastic_ip"
  }
}

# Nat Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet["public-subnet-1"].id

  tags = {
    Name = "nat_gateway"
  }

}

# Private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "private_route_table"
  }
}

# Route table association
resource "aws_route_table_association" "public_subnet_one_rt_association" {
  for_each = var.public_subnets
  subnet_id      = aws_subnet.public_subnet[each.value.tag_name].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_one_rt_association" {
  for_each = var.private_subnets
  subnet_id      = aws_subnet.private_subnet[each.value.tag_name].id
  route_table_id = aws_route_table.private_route_table.id
}

# Security group for jenkins
resource "aws_security_group" "allow_tls_jenkins" {
  
  name        = "allow_tls_jenkins"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.custom_vpc.id
  
  dynamic "ingress" {
    for_each = var.allow_tls_jenkins
    iterator = item
    content {
        description = item.value.description
        from_port   = item.value.from_port
        to_port     = item.value.to_port
        protocol    = item.value.protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls_jenkins"
  }
}

# Security group for eks
resource "aws_security_group" "allow_tls_eks" {
  name        = "allow_tls_eks"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.custom_vpc.id

  dynamic "ingress" {
    for_each = var.allow_tls_eks
    iterator = item
    content {
        description = item.value.description
        from_port   = item.value.from_port
        to_port     = item.value.to_port
        protocol    = item.value.protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls_eks"
  }
}

