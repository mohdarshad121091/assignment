output "virtual_network_id" {
  value = {for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.id  }
}
