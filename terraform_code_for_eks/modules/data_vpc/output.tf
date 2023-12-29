
output "public_subnet_1" {
  value = data.aws_subnet.public_subnet_1
}

output "public_subnet_2" {
  value = data.aws_subnet.public_subnet_2
}

output "private_subnet_1" {
  value = data.aws_subnet.private_subnet_1
}

output "private_subnet_2" {
  value = data.aws_subnet.private_subnet_2
}

output "instance_key_pair" {
  value = data.aws_key_pair.instance_key_pair
}

output "allow_tls_eks" {
  value = data.aws_security_group.allow_tls_eks
}

