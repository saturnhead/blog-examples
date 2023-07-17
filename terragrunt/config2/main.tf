provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {}
}

resource "aws_subnet" "this" {
    cidr_block = "10.0.1.0/24"
    vpc_id     = var.vpc_id
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}