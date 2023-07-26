<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | Region used for resource creation | `string` | `"us-east-1"` | no |
| <a name="input_security_group_params"></a> [security\_group\_params](#input\_security\_group\_params) | Security group related parameters | <pre>map(object({<br>    tags             = map(string)<br>    use_existing_vpc = optional(bool, false)<br>    vpc_id           = string<br>  }))</pre> | `{}` | no |
| <a name="input_sg_rule_params"></a> [sg\_rule\_params](#input\_sg\_rule\_params) | Security group rules related parameters | <pre>map(object({<br>    cidr_blocks     = list(string)<br>    use_existing_sg = optional(bool, false)<br>    sg_id           = string<br>    protocol        = optional(string, "tcp")<br>    from_port       = number<br>    to_port         = number<br>    type            = optional(string, "egress")<br>  }))</pre> | `{}` | no |
| <a name="input_subnet_params"></a> [subnet\_params](#input\_subnet\_params) | Subnet related parameters | <pre>map(object({<br>    cidr_block       = string<br>    tags             = map(string)<br>    use_existing_vpc = optional(bool, false)<br>    vpc_id           = string<br>  }))</pre> | `{}` | no |
| <a name="input_vpc_params"></a> [vpc\_params](#input\_vpc\_params) | VPC related parameters | <pre>map(object({<br>    cidr_block = string<br>    tags       = map(string)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_paramaters"></a> [vpc\_paramaters](#output\_vpc\_paramaters) | vpc\_parameters |
<!-- END_TF_DOCS -->