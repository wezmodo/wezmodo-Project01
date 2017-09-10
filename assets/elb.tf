resource "aws_elb" "web-elb" {
  name                    = "web-elb-test"
  availability_zones      = ["S{data.aws_availability_zones.all.names}"]  

  listener {
    lb_port               = 80
    lb_protocol           = "http"
    instance_port         = "${var.server_port}"
    instance_protcol      = "tcp"
  }
}