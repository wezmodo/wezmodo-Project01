# resource "aws_route" "rtbl" {
#   route_table_id            = "${aws_route_table.route_personnal.id}"
#   destination_cidr_block    = "172.30.2.0/24"
#   depends_on                = ["aws_route_table.route_personnal"]
  
#   tags {
#     Name = "rtbl"
#   }
# }
