resource "azurerm_resource_group" "dev-rg1" {
  name     = var.resource_group_name
  location = var.location
}