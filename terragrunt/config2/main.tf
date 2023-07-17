provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {}
}

resource "aws_subnet" "this" {
    cidr_block = "10.0.1.0/24"
    vpc_id     = dependency.config1.outputs.vpc_id
}