provider "aws" {
  region = "eu-west-1"
}
resource "aws_vpc" "this" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "this" {
  cidr_block = "10.1.5.0/24"
  vpc_id     = aws_vpc.this.id
}