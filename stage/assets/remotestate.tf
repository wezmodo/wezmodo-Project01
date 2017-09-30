
terraform {
  backend "s3" {
    bucket = "modotronicstatefile"
    key    = "assets/terraform.tfstate"
    region = "eu-west-1"
  }
}