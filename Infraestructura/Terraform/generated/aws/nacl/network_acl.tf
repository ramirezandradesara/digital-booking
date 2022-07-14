resource "aws_network_acl" "tfer--acl-002D-0a51a8dc1d35d2962" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["subnet-0d846fd6102ec0ffc", "subnet-0a99dd0b451710b25", "subnet-0ad48a49947c70a8d", "subnet-0cb1e3d226b95a239"]
  vpc_id     = "vpc-0e29e34be3b7e7717"
}
