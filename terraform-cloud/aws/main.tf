provider "aws" {
  region = var.region
}

resource "aws_vpc" "this" {
  for_each   = var.vpc_params
  cidr_block = each.value.cidr_block
  tags       = each.value.tags
}

resource "aws_subnet" "this" {
  for_each   = var.subnet_params
  cidr_block = each.value.cidr_block
  vpc_id     = each.value.use_existing_vpc ? each.value.vpc_id : aws_vpc.this[each.value.vpc_id].id
  tags       = each.value.tags
}

resource "aws_security_group" "this" {
  for_each = var.security_group_params
  name     = each.key
  vpc_id   = each.value.use_existing_vpc ? each.value.vpc_id : aws_vpc.this[each.value.vpc_id].id
  tags     = each.value.tags
}

resource "aws_security_group_rule" "this" {
  for_each          = var.sg_rule_params
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = each.value.use_existing_sg ? each.value.sg_id : aws_security_group.this[each.value.sg_id].id
}
