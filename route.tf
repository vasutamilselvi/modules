locals {
  route_name = "${terraform.workspace}-route" 
}
resource "aws_route_table" "route_public" {
  vpc_id = aws_vpc.vpc_terra.id

  route {
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    name = local.route_name
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.terra_subnet_public.id
  route_table_id = aws_route_table.route_public.id
}