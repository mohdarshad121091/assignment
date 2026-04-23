resource "azurerm_key_vault" "kv" {
  for_each = var.key_vault
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  tenant_id = each.value.tenant_id
  sku_name = each.value.sku_name

  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled = each.value.purge_protection_enabled
}

resource "azurerm_key_vault_secret" "secret" {
  for_each = var.keyvault_secret
  name = each.value.name
  value = each.value.value
  key_vault_id = azurerm_key_vault.kv[each.value.key_vault_name].id
  
}

resource "azurerm_key_vault_access_policy" "access_policy" {
  for_each = var.keyvault_access_policy
  key_vault_id = azurerm_key_vault.kv[each.value.key_vault_name].id
  tenant_id = each.value.tenant_id
  object_id = each.value.object_id
  
  secret_permissions = each.value.secret_permissions
}