resource "aws_instance" "my_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count
  subnet_id     = aws_subnet.subnet_terra.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "MyTerraformInstance"
  }
}