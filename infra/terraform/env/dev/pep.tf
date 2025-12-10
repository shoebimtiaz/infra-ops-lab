resource "azurerm_private_endpoint" "cosmos_pep" {
  name                = "cosmos-pep"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  subnet_id           = azurerm_subnet.db_subnet.id

  private_service_connection {
    name                           = "cosmos-priv-conn"
    private_connection_resource_id = azurerm_cosmosdb_account.cosmos_account.id
    subresource_names              = ["Sql"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_endpoint" "sql_pep" {
  name                = "sql-pep"
  resource_group_name = azurerm_resource_group.dev_rg.name
  location            = azurerm_resource_group.dev_rg.location
  subnet_id           = azurerm_subnet.db_subnet.db_subnet.id

  private_service_connection {
    name                           = "sql-priv-conn"
    private_connection_resource_id = azurerm_sql_server.sql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_endpoint" "storage_pep" {
  name                = "storage-pep"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  subnet_id           = azurerm_subnet.db_subnet.id

  private_service_connection {
    name                           = "storage-priv-conn"
    private_connection_resource_id = azurerm_storage_account.storage_account.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}


