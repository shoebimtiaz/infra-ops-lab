resource "azurerm_cdn_profile" "profile" {
  name                = "cdn-profile"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "endpoint" {
  name                = "book-images-cdn"
  profile_name        = azurerm_cdn_profile.profile.name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  origin {
    name      = "blob-origin"
    host_name = "${azurerm_storage_account.storage.name}.blob.core.windows.net"
  }

  origin_path = "/images"   # CDN only serves processed images
}
