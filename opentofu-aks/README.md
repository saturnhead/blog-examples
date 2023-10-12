# opentofu-aks

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.49.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kube_params"></a> [kube\_params](#input\_kube\_params) | AKS parameters | <pre>map(object({<br>    rg_name             = string<br>    dns_prefix          = string<br>    np_name             = string<br>    tags                = optional(map(string), {})<br>    vm_size             = optional(string, "Standard_B2s")<br>    client_id           = optional(string, null)<br>    client_secret       = optional(string, null)<br>    enable_auto_scaling = optional(bool, false)<br>    max_count           = optional(number, 1)<br>    min_count           = optional(number, 1)<br>    node_count          = optional(number, 1)<br>    service_principal = optional(list(object({<br>      client_id     = string<br>      client_secret = string<br>    })), [])<br>    identity = optional(list(object({<br>      type         = optional(string, "SystemAssigned")<br>      identity_ids = optional(list(string), [])<br>    })), [{}])<br>  }))</pre> | <pre>{<br>  "aks1": {<br>    "dns_prefix": "kube",<br>    "np_name": "np1",<br>    "rg_name": "rg1"<br>  }<br>}</pre> | no |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | Resource Groups Parameters | <pre>map(object({<br>    location = string<br>  }))</pre> | <pre>{<br>  "rg1": {<br>    "location": "westus"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks"></a> [aks](#output\_aks) | AKS Outputs |
| <a name="output_resource_groups"></a> [resource\_groups](#output\_resource\_groups) | Resource Group Outputs |
<!-- END_TF_DOCS -->