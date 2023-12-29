output "custom_vpc" {
  value = aws_vpc.custom_vpc
}

output "public_subnet" {
  value = aws_subnet.public_subnet
}

output "private_subnet" {
  value = aws_subnet.private_subnet
}

output "vpc_security_group_ids" {
  value = aws_security_group.allow_tls_jenkins
}