output "aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-listener-002F-app-002F-G6C1-002F-54f4b00d25e52a1f-002F-ad0b0b7844ff45cb_id" {
  value = "${aws_lb_listener.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-listener-002F-app-002F-G6C1-002F-54f4b00d25e52a1f-002F-ad0b0b7844ff45cb.id}"
}

output "aws_lb_target_group_attachment_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-targetgroup-002F-G6C1-002D-TG-002D-publicServers-002F-88ca33ae8a478720-002D-20220630214541579100000001_id" {
  value = "${aws_lb_target_group_attachment.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-targetgroup-002F-G6C1-002D-TG-002D-publicServers-002F-88ca33ae8a478720-002D-20220630214541579100000001.id}"
}

output "aws_lb_target_group_attachment_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-targetgroup-002F-G6C1-002D-TG-002D-publicServers-002F-88ca33ae8a478720-002D-20220630214541579100000002_id" {
  value = "${aws_lb_target_group_attachment.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-002D-north-002D-1-003A-145504712931-003A-targetgroup-002F-G6C1-002D-TG-002D-publicServers-002F-88ca33ae8a478720-002D-20220630214541579100000002.id}"
}

output "aws_lb_target_group_tfer--G6C1-002D-TG-002D-publicServers_id" {
  value = "${aws_lb_target_group.tfer--G6C1-002D-TG-002D-publicServers.id}"
}

output "aws_lb_tfer--G6C1_id" {
  value = "${aws_lb.tfer--G6C1.id}"
}
