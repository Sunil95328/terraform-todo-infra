resource "azurerm_key_vault_secret" "user_name" {
  name         = var.user_name
    value        = var.user_name_value
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}


