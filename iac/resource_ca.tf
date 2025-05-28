resource "azurerm_container_app" "ca" {
  name                = "f1-api-ca-${var.env_id}"
  resource_group_name = azurerm_resource_group.f1rg.name
  container_app_environment_id = azurerm_container_app_environment.cae.id

  revision_mode = "Multiple"

  template {
    min_replicas = 1
    max_replicas = 3

    container {
      image = "mcr.microsoft.com/k8se/quickstart:latest"
      cpu = "0.25"
      memory = "0.5Gi"
      name = "f1-app-${var.env_id}"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled = true
    target_port      = 8080

    traffic_weight {
        percentage = 100
        label = "primary"
        latest_revision = true
    }
  }

  tags = {
    environment = var.env_id
    source      = var.src_key
  }
}
