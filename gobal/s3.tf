terraform {
  backend "s3" {
    bucket = "modotronic_statefile"
    key    = "<project name>/terraform.tfstate"
    region = "eu-west-1"
  }
}