resource "aws_main_route_table_association" "tfer--vpc-002D-0e29e34be3b7e7717" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-002D-035c8c1e3a58fdb2a_id}"
  vpc_id         = "vpc-0e29e34be3b7e7717"
}
