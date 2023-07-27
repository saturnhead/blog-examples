variable "region" {
  description = "Region used for resource creation"
  type        = string
  default     = "us-east-1"
}

variable "vpc_params" {
  description = "VPC related parameters"
  type = map(object({
    cidr_block = string
    tags       = map(string)
  }))
  default = {}
}

variable "subnet_params" {
  description = "Subnet related parameters"
  type = map(object({
    cidr_block       = string
    tags             = map(string)
    use_existing_vpc = optional(bool, false)
    vpc_id           = string
  }))
  default = {}
}

variable "security_group_params" {
  description = "Security group related parameters"
  type = map(object({
    tags             = map(string)
    use_existing_vpc = optional(bool, false)
    vpc_id           = string
  }))
  default = {}
}

variable "sg_rule_params" {
  description = "Security group rules related parameters"
  type = map(object({
    cidr_blocks     = list(string)
    use_existing_sg = optional(bool, false)
    sg_id           = string
    protocol        = optional(string, "tcp")
    from_port       = number
    to_port         = number
    type            = optional(string, "egress")
  }))
  default = {}
}
