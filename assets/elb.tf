resource "aws_elb" "web-elb" {
  name                    = "web-elb-test"
  availability_zones      = ["S{data.aws_availability_zones.all.names}"]  
  security_groups         = ["${aws_security_group.web-elb.id}"]
  listener {
    lb_port               = 80
    lb_protocol           = "http"
    instance_port         = "${var.server_port}"
    instance_protcol      = "http"
  }

  health_check {
    healthy_threshold      = 2
    unhealthy_threshold    = 2
    timeout                = 3
    interval               = 30
    target                 = "HTTP:${var.server_port}/"
  }
}