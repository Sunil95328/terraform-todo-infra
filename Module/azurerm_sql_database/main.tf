resource "azurerm_mssql_database" "dev-sql-db" {
  name         = var.sql_database_name
  server_id    = data.azurerm_mssql_server.data_sql_server.id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = var.max_size_gb
  sku_name     = var.sku_name
}
    