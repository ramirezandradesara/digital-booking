terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
provider "aws" {
  region = "eu-north-1"
}

/*VPC*/
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

/*SUBREDES DE VPC*/
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

/*GATEWAY DE INTERNET*/
resource "aws_internet_gateway" "tfer--igw-002D-071f1d0cb22b7f75f" {
  tags = {
    Name = "Grupo6-C1-igw"
  }

  tags_all = {
    Name = "Grupo6-C1-igw"
  }

  vpc_id = "vpc-0e29e34be3b7e7717"
}

/*GRUPOS DE SEGURIDAD*/
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

/*TABLAS DE RUTEO*/
resource "aws_main_route_table_association" "tfer--vpc-002D-0e29e34be3b7e7717" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-002D-035c8c1e3a58fdb2a_id}"
  vpc_id         = "vpc-0e29e34be3b7e7717"
}
resource "aws_route_table_association" "tfer--subnet-002D-0a99dd0b451710b25" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-002D-0be3e1149d1a3dbcb_id}"
  subnet_id      = "subnet-0a99dd0b451710b25"
}
resource "aws_route_table_association" "tfer--subnet-002D-0ad48a49947c70a8d" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-002D-02fc51958a0448345_id}"
  subnet_id      = "subnet-0ad48a49947c70a8d"
}
resource "aws_route_table_association" "tfer--subnet-002D-0cb1e3d226b95a239" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-002D-0be3e1149d1a3dbcb_id}"
  subnet_id      = "subnet-0cb1e3d226b95a239"
}
resource "aws_route_table_association" "tfer--subnet-002D-0d846fd6102ec0ffc" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-002D-0c7256e0d0225aba1_id}"
  subnet_id      = "subnet-0d846fd6102ec0ffc"
}
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


/*ACL*/
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

/*IP ELASTICAS*/
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

/*INSTANCIAS EC2 T3.MICRO*/
resource "aws_instance" "tfer--i-002D-00fe95e4feea41dae_G6C1-002D-Api-002D-server" {
  ami                         = "ami-01ded35841bc93d7f"
  associate_public_ip_address = "true"
  availability_zone           = "eu-north-1a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "true"
  disable_api_termination = "true"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = "0"
  key_name                             = "Key-I-G6-CICD"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "true"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.1.2.60"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "20"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0ad48a49947c70a8d_id}"

  tags = {
    Name = "G6C1-Api-server"
  }

  tags_all = {
    Name = "G6C1-Api-server"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["sg-0057f600ec3851d73"]
}
resource "aws_instance" "tfer--i-002D-034ef118c3365bb80_G6C1-002D-publicServer-002D-A" {
  ami                         = "ami-0440e5026412ff23f"
  associate_public_ip_address = "true"
  availability_zone           = "eu-north-1a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = "0"
  key_name                             = "Public-server-G6C1"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "true"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.1.0.16"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "30"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0cb1e3d226b95a239_id}"

  tags = {
    Name = "G6C1-publicServer-A"
  }

  tags_all = {
    Name = "G6C1-publicServer-A"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["sg-0901a9123d68df0b1"]
}
resource "aws_instance" "tfer--i-002D-0ec2b747327f9a334_G6C1-002D-publicServer-002D-B" {
  ami                         = "ami-0440e5026412ff23f"
  associate_public_ip_address = "true"
  availability_zone           = "eu-north-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "2"

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = "0"
  key_name                             = "Public-server-G6C1"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "true"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.1.0.104"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    volume_size           = "30"
    volume_type           = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0a99dd0b451710b25_id}"

  tags = {
    Name = "G6C1-publicServer-B"
  }

  tags_all = {
    Name = "G6C1-publicServer-B"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["sg-0901a9123d68df0b1"]
}

/*BUCKET S3*/
resource "aws_s3_bucket" "tfer--s3-002D-grupo6-002D-c1-002D-0821" {
  arn           = "arn:aws:s3:::s3-grupo6-c1-0821"
  bucket        = "s3-grupo6-c1-0821"
  force_destroy = "false"

  grant {
    permissions = ["READ", "READ_ACP"]
    type        = "Group"
    uri         = "http://acs.amazonaws.com/groups/global/AllUsers"
  }

  grant {
    permissions = ["READ_ACP", "READ"]
    type        = "Group"
    uri         = "http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
  }

  grant {
    id          = "efdc37cd3216dce748e467fc4f9fb55bf3fc158671ee329f10333d671c7e97f1"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  grant {
    permissions = ["READ_ACP", "READ"]
    type        = "Group"
    uri         = "http://acs.amazonaws.com/groups/s3/LogDelivery"
  }

  hosted_zone_id      = "Z3BAZG2TWCNX0D"
  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

/*BASE DE DATOS*/
resource "aws_db_instance" "tfer--bdd-002D-g6-002D-c1" {
  allocated_storage                     = "49"
  auto_minor_version_upgrade            = "true"
  availability_zone                     = "eu-north-1a"
  backup_retention_period               = "7"
  backup_window                         = "02:49-03:19"
  ca_cert_identifier                    = "rds-ca-2019"
  copy_tags_to_snapshot                 = "true"
  customer_owned_ip_enabled             = "false"
  db_subnet_group_name                  = "${aws_db_subnet_group.tfer--default-002D-vpc-002D-0e29e34be3b7e7717.name}"
  deletion_protection                   = "false"
  engine                                = "mysql"
  engine_version                        = "8.0.28"
  iam_database_authentication_enabled   = "false"
  identifier                            = "bdd-g6-c1"
  instance_class                        = "db.t3.micro"
  iops                                  = "0"
  kms_key_id                            = "arn:aws:kms:eu-north-1:145504712931:key/70dd22e2-53dc-4283-af00-af18de5a486a"
  license_model                         = "general-public-license"
  maintenance_window                    = "sun:23:06-sun:23:36"
  max_allocated_storage                 = "1000"
  monitoring_interval                   = "60"
  monitoring_role_arn                   = "arn:aws:iam::145504712931:role/rds-monitoring-role"
  multi_az                              = "false"
  option_group_name                     = "default:mysql-8-0"
  parameter_group_name                  = "default.mysql8.0"
  performance_insights_enabled          = "false"
  performance_insights_retention_period = "0"
  port                                  = "3306"
  publicly_accessible                   = "true"
  storage_encrypted                     = "true"
  storage_type                          = "gp2"
  username                              = "admin"
  vpc_security_group_ids                = ["sg-0429a1f4eb931fea0"]
}
resource "aws_db_subnet_group" "tfer--default-002D-vpc-002D-0e29e34be3b7e7717" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-0e29e34be3b7e7717"
  subnet_ids  = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0a99dd0b451710b25_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0ad48a49947c70a8d_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0cb1e3d226b95a239_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0d846fd6102ec0ffc_id}"]
}

/*BALANCEADOR DE CARGA*/
resource "aws_lb" "tfer--G6C1" {
  desync_mitigation_mode     = "defensive"
  drop_invalid_header_fields = "false"
  enable_deletion_protection = "false"
  enable_http2               = "true"
  enable_waf_fail_open       = "false"
  idle_timeout               = "60"
  internal                   = "false"
  ip_address_type            = "ipv4"
  load_balancer_type         = "application"
  name                       = "G6C1"
  security_groups            = ["sg-0901a9123d68df0b1"]

  subnet_mapping {
    subnet_id = "subnet-0a99dd0b451710b25"
  }

  subnet_mapping {
    subnet_id = "subnet-0cb1e3d226b95a239"
  }

  subnets = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0cb1e3d226b95a239_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0a99dd0b451710b25_id}"]
}
resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-listener-002F-app-002F-G6C1-002F-54f4b00d25e52a1f-002F-ad0b0b7844ff45cb" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:eu-north-1:145504712931:targetgroup/G6C1-TG-publicServers/88ca33ae8a478720"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--G6C1_id}"
  port              = "80"
  protocol          = "HTTP"
}
resource "aws_lb_target_group_attachment" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-targetgroup-002F-G6C1-002D-TG-002D-publicServers-002F-88ca33ae8a478720-002D-20220630214541579100000001" {
  target_group_arn = "arn:aws:elasticloadbalancing:eu-north-1:145504712931:targetgroup/G6C1-TG-publicServers/88ca33ae8a478720"
  target_id        = "i-034ef118c3365bb80"
}
resource "aws_lb_target_group_attachment" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-targetgroup-002F-G6C1-002D-TG-002D-publicServers-002F-88ca33ae8a478720-002D-20220630214541579100000002" {
  target_group_arn = "arn:aws:elasticloadbalancing:eu-north-1:145504712931:targetgroup/G6C1-TG-publicServers/88ca33ae8a478720"
  target_id        = "i-0ec2b747327f9a334"
}
resource "aws_lb_target_group" "tfer--G6C1-002D-TG-002D-publicServers" {
  deregistration_delay = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "30"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "2"
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "G6C1-TG-publicServers"
  port                          = "80"
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  slow_start                    = "0"

  stickiness {
    cookie_duration = "86400"
    enabled         = "false"
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-0e29e34be3b7e7717"
}
/*ROUTE 53*/
resource "aws_route53_zone" "tfer--Z04291301MCSO7B1DONMF_digitalzooking-002E-sytes-002E-net" {
  comment       = "G6C1 digital zooking"
  force_destroy = "false"
  name          = "digitalzooking.sytes.net"
}
resource "aws_route53_record" "tfer--Z04291301MCSO7B1DONMF_digitalzooking-002E-sytes-002E-net-002E-_A_" {
  alias {
    evaluate_target_health = "true"
    name                   = "g6c1-2076445147.eu-north-1.elb.amazonaws.com"
    zone_id                = "Z23TAZ6LKFMNIO"
  }

  name    = "digitalzooking.sytes.net"
  type    = "A"
  zone_id = "${aws_route53_zone.tfer--Z04291301MCSO7B1DONMF_digitalzooking-002E-sytes-002E-net.zone_id}"
}
resource "aws_route53_record" "tfer--Z04291301MCSO7B1DONMF_digitalzooking-002E-sytes-002E-net-002E-_NS_" {
  name    = "digitalzooking.sytes.net"
  records = ["ns-1599.awsdns-07.co.uk.", "ns-244.awsdns-30.com.", "ns-799.awsdns-35.net.", "ns-1111.awsdns-10.org."]
  ttl     = "172800"
  type    = "NS"
  zone_id = "${aws_route53_zone.tfer--Z04291301MCSO7B1DONMF_digitalzooking-002E-sytes-002E-net.zone_id}"
}
resource "aws_route53_record" "tfer--Z04291301MCSO7B1DONMF_digitalzooking-002E-sytes-002E-net-002E-_SOA_" {
  name    = "digitalzooking.sytes.net"
  records = ["ns-799.awsdns-35.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = "900"
  type    = "SOA"
  zone_id = "${aws_route53_zone.tfer--Z04291301MCSO7B1DONMF_digitalzooking-002E-sytes-002E-net.zone_id}"
}