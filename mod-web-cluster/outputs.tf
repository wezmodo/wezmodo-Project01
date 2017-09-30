output "elb_dns_name" {
  value = "${aws_elb.web-elb.dns_name}"
}


output "elb_security_group_id" {
  value = "${aws_security_group.elb-sg.id}"
}

output "web_security_group_id" {
  value = "${aws_security_group.instance.id}"
}