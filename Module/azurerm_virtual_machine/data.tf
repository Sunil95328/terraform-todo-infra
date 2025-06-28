data "azurerm_key_vault" "data_key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  name         = var.user_name
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
  
}

data "azurerm_key_vault_secret" "password" {
  name         = var.password
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
  
}