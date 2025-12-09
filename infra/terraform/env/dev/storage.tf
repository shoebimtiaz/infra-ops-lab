resource "azurerm_storage_account" "storage_account" {
  name                     = "storageaccount"
  resource_group_name      = azurerm_resource_group.dev_rg.name
  location                 = azurerm_resource_group.dev_rg.location
  account_tier             = "Free Tier"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "uploads_container" {
    name = "uploads"
    storage_account_id = azurerm_storage_account.storage_account.id
    container_access_type = "private"
}

resource "azurerm_storage_container" "images_container" {
    name = "images"
    storage_account_id = azurerm_storage_account.storage_account.id
    container_access_type = "private"
}