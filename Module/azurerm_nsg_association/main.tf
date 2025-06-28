resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = data.azurerm_subnet.data_subnet.id
  network_security_group_id = data.azurerm_network_security_group.data_nsg.id
}