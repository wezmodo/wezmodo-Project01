resource "aws_security_group" "instance" {
  name                = "web-example"

  ingress {
    from_port         = "${var.server_port}"
    to_port           = "${var.server_port}"
    protocol          = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
  }
  
  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "instance"
  }
}
