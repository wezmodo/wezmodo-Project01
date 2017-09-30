provider "aws" {}

resource "aws_kms_key" "test" {
  description                 = "Just for teting purposes"

}



resource "aws_kms_alias" "test" {
  name          = "alias/test"
  target_key_id = "${aws_kms_key.test.key_id}"
}
