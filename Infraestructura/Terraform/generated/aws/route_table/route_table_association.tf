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
