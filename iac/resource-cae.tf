resource "azurerm_container_app_environment" "cae" {
  name                = "cesf1cae"
  location            = azurerm_resource_group.f1rg.location
  resource_group_name = azurerm_resource_group.f1rg.name

  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  tags = {
    environment = var.env_id
    source      = var.src_key
  }
}
