data "azuread_client_config" "current" {}

resource "azuread_group" "groups" {
  for_each         = toset(var.ad_groups)
  display_name     = each.value
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}