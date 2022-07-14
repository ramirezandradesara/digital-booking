resource "aws_subnet" "tfer--subnet-002D-0a99dd0b451710b25" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.1.0.64/26"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Grupo6-C1-subnet-public2-eu-north-1b"
  }

  tags_all = {
    Name = "Grupo6-C1-subnet-public2-eu-north-1b"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_subnet" "tfer--subnet-002D-0ad48a49947c70a8d" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.1.2.0/26"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Grupo6-C1-subnet-private1-eu-north-1a"
  }

  tags_all = {
    Name = "Grupo6-C1-subnet-private1-eu-north-1a"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_subnet" "tfer--subnet-002D-0cb1e3d226b95a239" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.1.0.0/26"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Grupo6-C1-subnet-public1-eu-north-1a"
  }

  tags_all = {
    Name = "Grupo6-C1-subnet-public1-eu-north-1a"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_subnet" "tfer--subnet-002D-0d846fd6102ec0ffc" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.1.2.64/26"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Grupo6-C1-subnet-private2-eu-north-1b"
  }

  tags_all = {
    Name = "Grupo6-C1-subnet-private2-eu-north-1b"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}
