resource "aws_eip" "tfer--eipalloc-002D-04e5aea4056a6636d" {
  network_border_group = "eu-north-1"
  public_ipv4_pool     = "amazon"

  tags = {
    Name = "IP-Public-G6"
  }

  tags_all = {
    Name = "IP-Public-G6"
  }

  vpc = "true"
}