resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-listener-002F-app-002F-G6C1-002F-54f4b00d25e52a1f-002F-ad0b0b7844ff45cb" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:eu-north-1:145504712931:targetgroup/G6C1-TG-publicServers/88ca33ae8a478720"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--G6C1_id}"
  port              = "80"
  protocol          = "HTTP"
}
