resource "aws_db_subnet_group" "tfer--default-002D-vpc-002D-0e29e34be3b7e7717" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-0e29e34be3b7e7717"
  subnet_ids  = ["${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0a99dd0b451710b25_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0ad48a49947c70a8d_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0cb1e3d226b95a239_id}", "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-002D-0d846fd6102ec0ffc_id}"]
}
