# AWS Instance Key Pair
resource "aws_key_pair" "instance_key_pair" {
  key_name   = "instance_key_pair"
  public_key = file("/Users/moin/.ssh/id_rsa.pub")
  
  tags = {
    Name = "instance_key_pair"
  }
}

# Jenkins server
resource "aws_instance" "jenkins_server" {
  ami                         = var.ami
  key_name                    = aws_key_pair.instance_key_pair.key_name
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.public_subnet["public-subnet-1"].id
  vpc_security_group_ids      = [var.vpc_security_group_ids.id]
  user_data                   = file("${path.module}/jenkins-server-script.sh")
  tags = {
    Name = var.vm_name
  }

}
