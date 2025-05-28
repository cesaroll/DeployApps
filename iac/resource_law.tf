resource "azurerm_log_analytics_workspace" "law" {
  name                = "cesf1law${var.env_id}"
  location            = azurerm_resource_group.f1rg.location
  resource_group_name = azurerm_resource_group.f1rg.name
  sku                 = "PerGB2018"

  retention_in_days   = 30

  tags = {
    environment = var.env_id
    source      = var.src_key
  }
}
