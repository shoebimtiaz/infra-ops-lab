resource "azurerm_storage_acccount" "storage_account" {
    name = "storageaccount"
    resource_group_name = azurerm_resource_group.dev_rg.name
    location = azurerm_resource_group.dev_rg.location
    account_tier = "Free Tier"
    account_replication_type = "LRS"
}