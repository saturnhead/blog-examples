provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {}
}

resource "aws_security_group" "this" {
  name   = "this"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "security_group1"
    env   = "dev"
    owner = "config3"
  }
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}