resource "azurerm_role_assignment" "key_rbac" {
  scope                = data.azurerm_key_vault.data_key_vault.id
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}