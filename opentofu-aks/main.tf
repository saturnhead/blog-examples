provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  for_each = var.resource_groups
  name     = each.key
  location = each.value.location
}

resource "azurerm_kubernetes_cluster" "this" {
  for_each            = var.kube_params
  name                = each.key
  location            = azurerm_resource_group.this[each.value.rg_name].location
  resource_group_name = azurerm_resource_group.this[each.value.rg_name].name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    enable_auto_scaling = each.value.enable_auto_scaling
    max_count           = each.value.enable_auto_scaling ? each.value.max_count : null
    min_count           = each.value.enable_auto_scaling ? each.value.min_count : null
    node_count          = each.value.node_count
    vm_size             = each.value.vm_size
    name                = each.value.np_name
  }

  dynamic "service_principal" {
    for_each = each.value.service_principal
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dynamic "identity" {
    for_each = each.value.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
  tags = each.value.tags
}
