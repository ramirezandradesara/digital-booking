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
