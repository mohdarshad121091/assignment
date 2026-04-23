output "key_vault_name" {
  value = {for kv in azurerm_key_vault.kv : kv.name => kv.name  }
}

output "key_vault_id" {
  value = {for kv in azurerm_key_vault.kv : kv.name => kv.id  }
}

output "key_vault_secret_id" {
  value = {for secret in azurerm_key_vault_secret.secret : secret.name => secret.id  }
}

output "key_vault_access_policy_id" {
  value = {  for k, v in azurerm_key_vault_access_policy.access_policy : k => v.id }
}

# output "current_object_id" {
#   value = {for config in azurerm_client_config.current : config.object_id  }
# }