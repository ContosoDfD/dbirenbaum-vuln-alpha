resource "aws_vpc" "alpha_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "alpha_public" {
  vpc_id                  = aws_vpc.alpha_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_flow_log" "disabled" {
  # VPC flow logs intentionally missing
}

resource "aws_network_acl" "alpha_open_nacl" {
  vpc_id = aws_vpc.alpha_vpc.id
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}