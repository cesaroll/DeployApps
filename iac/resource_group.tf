resource "azurerm_resource_group" "f1rg" {
  name     = "ces-f1-rg-${var.env_id}"
  location = var.location


  tags = {
    environment = var.env_id
    source = var.src_key
  }
}
