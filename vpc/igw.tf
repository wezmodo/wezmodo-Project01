provider "aws" {
  # access_key = "${var.aws_access_key}"
  # secret_key = "${var.aws_secret_key}"
  # region     = "eu-west-1" 
}

  resource "aws_internet_gateway" "igw_personnal"{
    vpc_id = "${aws_vpc.personnal.id}"

    tags {
      Name = "igw_personnal"
    }  

}

