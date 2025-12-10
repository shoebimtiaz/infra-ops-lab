# App Service Plan for Linux Consumption plan
resource "azurerm_app_service_plan" "function_plan" {
  name                = "function-app-plan"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  kind                = "Linux"
  reserved            = true  # required for Linux
  sku {
    tier = "Dynamic"       # Consumption plan
    size = "Y1"
  }
}

# Function App
resource "azurerm_linux_function_app" "image_processor" {
  name                       = "bookapp-image-processor"
  resource_group_name        = azurerm_resource_group.dev_rg.name
  location                   = azurerm_resource_group.dev_rg.location
  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id            = azurerm_app_service_plan.function_plan.id

  site_config {
    linux_fx_version = "DOTNET|10.0"
  }
}

