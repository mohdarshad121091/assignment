output "resource_group_id" {
  value = {for rg in azurerm_resource_group.rgs : rg.name => rg.id  }
}