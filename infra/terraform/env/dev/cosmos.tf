resource "azurerm_cosmosdb_account" "cosmos_account" {
  name                = "dev-cosmos-account"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.dev_rg.location
    failover_priority = 0
  }
}