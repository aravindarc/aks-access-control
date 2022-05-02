variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "resource group location"
  type        = string
}

variable "aks_name" {
  description = "aks name"
  type        = string
}

variable "aks_dns_prefix" {
  description = "aks dns prefix"
  type        = string
}

variable "aks_default_node_pool_count" {
  description = "aks default node pool count"
  type        = number
}

variable "aks_default_vm_size" {
  description = "aks default vm size"
  type        = string
}

variable "aks_admin_group_object_ids" {
  description = "aks admin group ids"
  type        = list(string)
}

variable "ad_groups" {
  description = "ad groups to be used in aks rolebindings"
  type        = list(string)
}