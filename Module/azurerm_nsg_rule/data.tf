data "azurerm_network_security_group" "data_nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
}