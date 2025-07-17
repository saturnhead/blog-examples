provider "vault" {
  address          = var.vault_address
  skip_child_token = true
  auth_login_jwt {
    role = "demo-role"
  }
}

data "vault_kv_secret_v2" "vpc_secret" {
  mount = "secret"
  name  = "data/vpc"
}

locals {
  vpc_cidr    = data.vault_kv_secret_v2.vpc_secret.data["cidr_block"]
  subnet_cidr = cidrsubnet(local.vpc_cidr, 8, 1)
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "this" {
  cidr_block = local.vpc_cidr
}

resource "aws_subnet" "this" {
  cidr_block = local.subnet_cidr
  vpc_id     = aws_vpc.this.id
}
