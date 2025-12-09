terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev_rg" {
  name     = "dev-resource-group"
  location = "Central US"
}

resource "azurerm_user_assigned_identity" "dev_identity" {
    name = "dev-identity"
    resource_group_name = azurerm_resource_group.dev_rg.name
    location = azurerm_resource_group.dev_rg.location
}

