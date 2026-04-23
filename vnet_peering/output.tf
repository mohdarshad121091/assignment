output "virtual_network_peering_id" {
  value = {for peering in azurerm_virtual_network_peering.peering : peering.name => peering.id  }
}