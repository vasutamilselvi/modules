locals {
  sg_name = "${terraform.workspace}-VPC" 
}
resource "aws_security_group" "terra_allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_terra.id

  tags = {
    Name = "local.sg_name"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.terra_allow_tls.id
  cidr_ipv4         = aws_vpc.vpc_terra.cidr_block
  from_port         = var.port_to_open
  ip_protocol       = "tcp"
  to_port           = var.port_to_open
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.terra_allow_tls.id
  cidr_ipv6         = aws_vpc.vpc_terra.ipv6_cidr_block
  from_port         = var.port_to_open
  ip_protocol       = "tcp"
  to_port           = var.port_to_open
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.terra_allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.terra_allow_tls.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}