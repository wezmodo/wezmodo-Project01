resource "aws_launch_configuration" "web-set" {
  image_id                = "ami-ebd02392"
  instance_type           = "${var.instance_type}"
  security_groups         = ["${aws_security_group.instance.id}"]
  user_data               = "${data.template_file.user_data.rendered}"
  lifecycle {
    create_before_destroy = true
  }                            
}   

resource "aws_autoscaling_group" "web-group" {
  launch_configuration    = "${aws_launch_configuration.web-set.id}"
  availability_zones      = ["${data.aws_availability_zones.all.names}"]
  
  min_size                = "${var.min_size}"
  max_size                =  "${var.max_size}"



  tags {
    key                   = "Name"
    value                 = "web-asg-test"
    propagate_at_launch   = true
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user-data.sh")}"
  
  vars {
    server_port = "${var.server_port}"
  }
}



