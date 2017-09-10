resource "aws_subnet" "private01" {
  vpc_id     = "${aws_vpc.personnal.id}"
  cidr_block = "172.30.1.0/24"

  tags {
    Name = "private01"
  }
}

resource "aws_subnet" "public01" {
  vpc_id     = "${aws_vpc.personnal.id}"
  cidr_block = "172.30.2.0/24"

  tags {
    Name = "public01"
  }
}