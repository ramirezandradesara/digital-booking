resource "aws_security_group" "tfer--SG-002D-BDD-002D-G6-002D-C1_sg-002D-0429a1f4eb931fea0" {
  description = "Created by RDS management console"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  name = "SG-BDD-G6-C1"

  tags = {
    Name = "G6C1-BDD"
  }

  tags_all = {
    Name = "G6C1-BDD"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_security_group" "tfer--SG-002D-EC2-002D-G6-002D-C1_sg-002D-0057f600ec3851d73" {
  description = "Grupo de seguridad instancias de Grupo 6 camada 1"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "VPC access"
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "SG-EC2-G6-C1"

  tags = {
    Name = "G6C1-Api-server"
  }

  tags_all = {
    Name = "G6C1-Api-server"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

resource "aws_security_group" "tfer--SG-002D-public-002D-server-002D-G6C1_sg-002D-0901a9123d68df0b1" {
  description = "Grupo de seguridad de servidores publicos G6C1"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso global web server"
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name = "SG-public-server-G6C1"

  tags = {
    Name = "G6C1-publicWeb-server"
  }

  tags_all = {
    Name = "G6C1-publicWeb-server"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}
