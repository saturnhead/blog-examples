provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
  vpc_id      = aws_vpc.this.id
}

resource "aws_security_group_rule" "example" {
  count             = 20
  type              = "ingress"
  from_port         = 80 + count.index
  to_port           = 80 + count.index
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.example.id
}