resource "azurerm_sql_server" "sql_server" {
    name = "dev-sql-server"
    resource_group_name = azurerm_resource_group.dev_rg.name
    location = azurerm_resource_group.dev_rg.location
    version = "12.0"
}

resource "azurerm_sql_database" "sql_database" {
    name = "dev-sql-database"
    resource_group_name = azurerm_resource_group.dev_rg.name
    location = azurerm_resource_group.dev_rg.location
    server_name = azurerm_sql_server.sql_server.name
    max_size_gb = 1

    lifecycle {
      prevent_destroy = true
    }
}