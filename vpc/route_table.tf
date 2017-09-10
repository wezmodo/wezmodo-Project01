resource "aws_route_table" "route_personnal" {
  vpc_id = "${aws_vpc.personnal.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw_personnal.id}"
  }


  tags {
    Name = "route_personnal"
  }
}

resource "aws_route_table_association" "out" {
  subnet_id      = "${aws_subnet.public01.id}"
  route_table_id = "${aws_route_table.route_personnal.id}"
}
