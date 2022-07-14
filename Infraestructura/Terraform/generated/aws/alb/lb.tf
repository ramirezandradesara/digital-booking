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
