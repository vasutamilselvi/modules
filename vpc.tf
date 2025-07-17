locals {
  VPC_name = "${terraform.workspace}-VPC" 
}
resource "aws_vpc" "vpc_terra" {
  cidr_block       = var.cidr_block_vpc
  instance_tenancy = "default"

  tags = {
    Name = "local.VPC_name"
  }
}