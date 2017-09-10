resource "aws_security_group" "instance" {
  name                = "web-example"

  ingress {
    from_port         = "${var.server_port}"
    to_port           = "${var.server_port}"
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }

egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]  
}
  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "instance"
  }
}

resource "aws_security_group" "web-elb" {
  name                = "web-example"

  ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]  
  }
  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "web-elb"
  }
}