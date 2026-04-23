output "azurerm_container_registry_name" {
  value = {for acr in azurerm_container_registry.acr : acr.name => acr.name  }
  
}

output "acr_id" {
  value = {
    for k, v in azurerm_container_registry.acr : k => v.id
  }
}

output "acr_login_server" {
  value = {
    for k, v in azurerm_container_registry.acr : k => v.login_server
  }
}

