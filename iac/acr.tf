resource "azurerm_container_registry" "acr" {
  name                  = "cesf1registry"
  location              = azurerm_resource_group.f1rg.location
  resource_group_name   = azurerm_resource_group.f1rg.name
  sku                   = "Standard"
  admin_enabled         = true
  public_network_access_enabled = true

  tags = {
    environment = var.env_id
    source = var.src_key
  }
}
