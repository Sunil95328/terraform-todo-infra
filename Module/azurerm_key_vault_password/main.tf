
resource "azurerm_key_vault_secret" "password" {
  name         = var.password
    value        = var.password_value
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}