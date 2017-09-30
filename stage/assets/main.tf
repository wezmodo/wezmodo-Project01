provider "aws" {}

module "mod-web-cluster" {
  source                = "../../mod-web-cluster"

  cluster_name          = "web-mod-test"
  # bucket_key            = "web-mod-test/terraform.tfstate"
  instance_type         = "t2.micro"
  min_size              = 2
  max_size              = 5
}

resource "aws_security_group_rule" "allow_testing_traffic" {
  type                  = "ingress"
  security_group_id     = "${module.mod-web-cluster.elb_security_group_id}"

  from_port             = 12345
  to_port               = 12345
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
}