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