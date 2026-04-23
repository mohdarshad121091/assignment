variable "key_vault" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    tenant_id = string
    sku_name = string
    soft_delete_retention_days = number
    purge_protection_enabled = bool
  }))   
  
}

variable "keyvault_secret" {
  type = map(object({
    name = string
    value = string
    key_vault_name = string
  }))       
  
}

variable "keyvault_access_policy" {
  type = map(object({
    key_vault_name = string
    tenant_id = string
    object_id = string
    secret_permissions = list(string)
  }))
  
}