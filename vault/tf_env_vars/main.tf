provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "this" {
  cidr_block = cidrsubnet(var.vpc_cidr, 8, 1)
  vpc_id     = aws_vpc.this.id
}
