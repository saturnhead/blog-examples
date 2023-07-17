provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {}
}

resource "aws_vpc" "this" {
    cidr_block = "10.0.0.0/16"
}