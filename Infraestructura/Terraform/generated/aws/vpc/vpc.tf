resource "aws_vpc" "tfer--vpc-002D-0e29e34be3b7e7717" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "10.1.0.0/22"
  enable_classiclink               = "false"
  enable_classiclink_dns_support   = "false"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"
  ipv6_netmask_length              = "0"

  tags = {
    Name = "G6C1-VPC"
  }

  tags_all = {
    Name = "G6C1-VPC"
  }
}
