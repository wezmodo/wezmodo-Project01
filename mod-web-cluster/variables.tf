provider "aws" {}

variable "region" {
  type                = "string"
  description         = "default region"
  default             = "eu-west-1"
}


variable "server_port" {
  default             = "8080"
  description         = "default port"
}

data "aws_availability_zones" "all" {}

variable "cluster_name" {
  type = "string"
  description = "name of cluster"
}

# variable "bucket_name" {
#   type = "string"
#   description = "remote state location"
# }

# variable "bucket_key" {
#   type = "string"
#   description = "remote state key"
# }

# terraform {
#   backend "s3" {
#     bucket = "modotronic_statefile"
#     key    = "${var.cluster_name}"
#     region = "eu-west-1"
#   }
# }

variable "min_size" {
  description = "minimum on start up"
}

variable "max_size" {
  description = "maximum on scale up"
}

variable "instance_type" {
  description = "choice of instance type to run e.g. t2.micro"
}