resource "aws_route_table" "tfer--rtb-002D-01e1236b0888d3197" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-07a0e1048ce796198"
  }

  tags = {
    Nat-grupo6-c1 = "RT-NGtoNET-G6C1"
  }

  tags_all = {
    Nat-grupo6-c1 = "RT-NGtoNET-G6C1"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_route_table" "tfer--rtb-002D-02fc51958a0448345" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-071f1d0cb22b7f75f"
  }

  route {
    cidr_block = "181.171.111.91/32"
    gateway_id = "igw-071f1d0cb22b7f75f"
  }

  tags = {
    Name = "Grupo6-C1-rtb-private1-eu-north-1a"
  }

  tags_all = {
    Name = "Grupo6-C1-rtb-private1-eu-north-1a"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_route_table" "tfer--rtb-002D-035c8c1e3a58fdb2a" {
  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_route_table" "tfer--rtb-002D-0be3e1149d1a3dbcb" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-071f1d0cb22b7f75f"
  }

  tags = {
    Name = "Grupo6-C1-rtb-public"
  }

  tags_all = {
    Name = "Grupo6-C1-rtb-public"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_route_table" "tfer--rtb-002D-0c7256e0d0225aba1" {
  tags = {
    Name = "Grupo6-C1-rtb-private2-eu-north-1b"
  }

  tags_all = {
    Name = "Grupo6-C1-rtb-private2-eu-north-1b"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}
