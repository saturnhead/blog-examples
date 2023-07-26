output "vpc_paramaters" {
  description = "vpc_parameters"
  value       = { for vpc in aws_vpc.this : vpc.id => { "arn" : vpc.arn, "cidr_block" : vpc.cidr_block } }
}
