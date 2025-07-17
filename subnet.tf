locals {
  subnet_name = "${terraform.workspace}-subnet" 
}
resource "aws_subnet" "subnet_terra" {
  vpc_id     = aws_vpc.vpc_terra
  cidr_block = var.cidr_block_subnet

  tags = {
    Name = "local.subnet_name"
  }
}