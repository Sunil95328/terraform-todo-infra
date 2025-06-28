resource "azurerm_mssql_server" "dev_sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = data.azurerm_key_vault_secret.user_name.value
  administrator_login_password = data.azurerm_key_vault_secret.password.value
  minimum_tls_version          = "1.2"

}