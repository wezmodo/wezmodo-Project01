resource "aws_vpc" "personnal" {
  cidr_block = "172.30.0.0/16"

  tags {
    Name = "personnal"
  }
}

