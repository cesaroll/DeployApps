# resource "azurerm_mssql_server" "sql_server" {
#     name                         = "ces-f1-sql-${var.env_id}"
#     location                     = azurerm_resource_group.f1rg.location
#     resource_group_name          = azurerm_resource_group.f1rg.name
#     version                      = "12.0"
#     administrator_login          = "f1admin"
#     administrator_login_password = var.sql_admin_password

#     tags = {
#         environment = var.env_id
#         source      = var.src_key
#     }
# }

# resource "azurerm_mssql_database" "sql_db" {
#     name        = "formula-one"
#     server_id   = azurerm_mssql_server.sql_server.id
#     collation = "SQL_Latin1_General_CP1_CI_AS"
#     license_type = "LicenseIncluded"
#     max_size_gb = "1"
#     sku_name = "S0"
#     zone_redundant = false

#     lifecycle {
#       prevent_destroy = false
#     }

#     tags = {
#         environment = var.env_id
#         source      = var.src_key
#     }
# }

# resource "azurerm_mssql_firewall_rule" "sql_fw_rule" {
#     name                = "AllowAllAzureIps"
#     server_id           = azurerm_mssql_server.sql_server.id
#     start_ip_address    = "0.0.0.0"
#     end_ip_address      = "0.0.0.0"
# }
