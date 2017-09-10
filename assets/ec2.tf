provider "aws" {}


resource "aws_instance" "web" {
    ami                     = "ami-ebd02392"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = ["${aws_security_group.instance.id}"]  

  lifecycle {
    create_before_destroy = true
  }
  
    tags {
      Name = "linux_box"
    }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}