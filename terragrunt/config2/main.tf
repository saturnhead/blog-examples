provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {}
}

resource "aws_subnet" "this" {
    cidr_block = "10.0.1.0/24"
    vpc_id     = var.vpc_id
    tags = {
      Name  = "subnet1"
      env   = "dev"
      owner = "config2"
    }
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}