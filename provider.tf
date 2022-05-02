terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.4.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.22.0"
    }
  }
}


provider "azuread" {
  tenant_id = "d69a2162-adf8-4a36-8c8c-36748031601e"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}