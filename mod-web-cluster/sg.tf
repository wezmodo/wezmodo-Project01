resource "aws_security_group" "instance" {
  name                            = "${var.cluster_name}-sg"
 
  tags {
    Name                          = "${var.cluster_name}-instance"
  }
}

resource "aws_security_group_rule" "allow__all_inbound_traffic" {
  
    type                          = "ingress"
    security_group_id             = "${aws_security_group.instance.id}" 
    from_port                     = "${var.server_port}"
    to_port                       = "${var.server_port}"
    protocol                      = "tcp"
    cidr_blocks                   = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow__all_outbound_traffic" {
    type                          = "egress"
    security_group_id             = "${aws_security_group.instance.id}" 
    from_port                     = 0
    to_port                       = 0
    protocol                      = "-1"
    cidr_blocks                   = ["0.0.0.0/0"]  
}



resource "aws_security_group" "elb-sg" {
  name                            = "${var.cluster_name}-elb-sg"

    tags {
    Name                          = "${var.cluster_name}-elb-sg"
  }
}

resource "aws_security_group_rule" "allow__http_inbound_traffic" {
    type                          = "ingress"
    security_group_id         = "${aws_security_group.elb-sg.id}" 
    from_port                     = 80
    to_port                       = 80
    protocol                      = "tcp"
    cidr_blocks                   = ["0.0.0.0/0"]
 } 

resource "aws_security_group_rule" "allow__http_outbound_traffic" {
    type                          = "egress"
    security_group_id         = "${aws_security_group.elb-sg.id}"      
    from_port                     = 0
    to_port                       = 0
    protocol                      = "-1"
    cidr_blocks                   = ["0.0.0.0/0"]  
}
