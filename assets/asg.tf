resource "aws_launch_configuration" "web-set" {
  image_id                = "ami-ebd02392"
  instance_type           = "t2.micro"
  security_groups         = ["${aws_security_group.instance.id}"]

  user_data               = <<-EOF
                              #!bin/bash
                              echo "Hello, world" > index.html
                              nohup busybox httpd -f -p "${var.server_port}" &
                            EOF
  lifecycle {
    create_before_destroy = true
  }                            
}   

resource "aws_autoscaling_group" "web-group" {
  launch_configuration    = "${aws_launch_configuration.web-set.id}"
  availability_zones      = ["S{data.aws_availability_zones.all.names}"]
  min_size                = 2
  max_size                = 10

  tags {
    key                   = "Name"
    value                 = "web-asg-test"
    propagate_at_launch   = true
  }
}