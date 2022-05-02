resource "azurerm_kubernetes_cluster" "aks1" {
  name                = var.aks_name
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.aks_default_node_pool_count
    vm_size    = var.aks_default_vm_size
  }

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = var.aks_admin_group_object_ids
    azure_rbac_enabled     = true
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "admin" {
  for_each = toset(var.aks_admin_group_object_ids)
  scope = azurerm_kubernetes_cluster.aks1.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id = each.value
}

resource "azurerm_role_assignment" "namespace-groups" {
  for_each = toset(var.ad_groups)
  scope = azurerm_kubernetes_cluster.aks1.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id = azuread_group.groups[each.value].id
}
