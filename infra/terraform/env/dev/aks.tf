resource "azurerm_aks_cluster" "dev_aks" {
  name                = "dev-aks-cluster"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  dns_prefix          = "devaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"

  }
}