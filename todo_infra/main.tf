module "resource_group_name" {
  source              = "../Module/azurerm_resource_group"
  resource_group_name = "todo-infra-rg"
  location            = "central India"

}

module "virtual_network_name" {
  depends_on           = [module.resource_group_name]
  source               = "../Module/azurerm_virtual_ network"
  virtual_network_name = "todo-infra-vnet"
  resource_group_name  = "todo-infra-rg"
  location             = "central India"
  address_space        = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on           = [module.virtual_network_name]
  source               = "../Module/azurerm_subnet"
  subnet_name          = "todo-frontend-subnet"
  virtual_network_name = "todo-infra-vnet"
  resource_group_name  = "todo-infra-rg"
  location             = "central India"
  address_prefix       = ["10.0.1.0/24"]

}

module "backend_subnet" {
  depends_on           = [module.virtual_network_name]
  source               = "../Module/azurerm_subnet"
  subnet_name          = "todo-backend-subnet"
  virtual_network_name = "todo-infra-vnet"
  resource_group_name  = "todo-infra-rg"
  location             = "central India"
  address_prefix       = ["10.0.2.0/24"]

}


module "nsg_frontend" {
  depends_on          = [module.virtual_network_name, module.frontend_subnet]
  source              = "../Module/azurerm_nsg"
  nsg_name            = "todo-frontend-nsg"
  resource_group_name = "todo-infra-rg"
  location            = "central India"
}

module "nsg_backend" {
  depends_on          = [module.virtual_network_name, module.backend_subnet]
  source              = "../Module/azurerm_nsg"
  nsg_name            = "todo-backend-nsg"
  resource_group_name = "todo-infra-rg"
  location            = "central India"
}

module "nsg_rule_frontend_ssh" {
  depends_on                 = [module.nsg_frontend]
  source                     = "../Module/azurerm_nsg_rule"
  nsg_name                   = "todo-frontend-nsg"
  nsg_rule_name              = "Allow-ssh-Frontend"
  priority                   = 200
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = "todo-infra-rg"

}

module "nsg_rule_frontend_http" {
  depends_on                 = [module.nsg_frontend]
  source                     = "../Module/azurerm_nsg_rule"
  nsg_name                   = "todo-frontend-nsg"
  nsg_rule_name              = "Allow-HTTP-Frontend"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = "todo-infra-rg"

}



module "nsg_rule_backend" {
  depends_on                 = [module.nsg_backend]
  source                     = "../Module/azurerm_nsg_rule"
  nsg_name                   = "todo-backend-nsg"
  nsg_rule_name              = "Allow-HTTP-Backend"
  priority                   = 300
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = "todo-infra-rg"

}

module "nsg_association_frontend" {
  depends_on           = [module.nsg_frontend, module.frontend_subnet]
  source               = "../Module/azurerm_nsg_association"
  nsg_name             = "todo-frontend-nsg"
  subnet_name          = "todo-frontend-subnet"
  virtual_network_name = "todo-infra-vnet"
  resource_group_name  = "todo-infra-rg"

}

module "nsg_association_backend" {
  depends_on           = [module.nsg_backend, module.backend_subnet]
  source               = "../Module/azurerm_nsg_association"
  nsg_name             = "todo-backend-nsg"
  subnet_name          = "todo-backend-subnet"
  virtual_network_name = "todo-infra-vnet"
  resource_group_name  = "todo-infra-rg"

}

module "frontend_pip" {
  depends_on          = [module.resource_group_name, module.virtual_network_name, module.frontend_subnet, module.backend_subnet]
  source              = "../Module/azurerm_public_ip"
  pip_name            = "todo-frontend-pip"
  resource_group_name = "todo-infra-rg"
  location            = "central India"
  allocation_method   = "Static"
}

module "backend_pip" {
  depends_on          = [module.resource_group_name, module.virtual_network_name, module.frontend_subnet, module.backend_subnet]
  source              = "../Module/azurerm_public_ip"
  pip_name            = "todo-backend-pip"
  resource_group_name = "todo-infra-rg"
  location            = "central India"
  allocation_method   = "Static"
}

module "key_vault" {
  depends_on          = [module.resource_group_name]
  source              = "../Module/azurerm_key_vault"
  key_vault_name      = "todo-infra-dev-keyvault"
  location            = "central India"
  resource_group_name = "todo-infra-rg"
  sku_name            = "standard"
}

module "key_rbac" {
  depends_on           = [module.key_vault]
  source               = "../Module/azure_rbac"
  key_vault_name       = "todo-infra-dev-keyvault"
  resource_group_name  = "todo-infra-rg"
  role_definition_name = "Key Vault Administrator"              # Replace with actual role definition name
  principal_id         = "831ae6d4-752f-41c5-8d65-97e798d1527d" # Replace with actual principal ID

}

module "kv_username" {
  depends_on          = [module.key_vault, module.key_rbac]
  source              = "../Module/azurerm_key_vault_user_name"
  key_vault_name      = "todo-infra-dev-keyvault"
  user_name           = "azureuser"
  user_name_value     = "admin01" # Replace with actual password
  resource_group_name = "todo-infra-rg"

}

module "kv_password" {
  depends_on          = [module.key_vault, module.key_rbac]
  source              = "../Module/azurerm_key_vault_password"
  key_vault_name      = "todo-infra-dev-keyvault"
  password            = "password"     # Replace with actual password
  password_value      = "Admin@012345" # Replace with actual password
  resource_group_name = "todo-infra-rg"

}

module "sql_server" {
  depends_on          = [module.resource_group_name, module.key_vault, module.key_rbac, module.kv_username, module.kv_password]
  source              = "../Module/azurerm_sql_server"
  sql_server_name     = "todo-infra-sql-server"
  resource_group_name = "todo-infra-rg"
  location            = "West US"
  server_version      = "12.0"
  key_vault_name      = "todo-infra-dev-keyvault"
  user_name           = "azureuser"
  password            = "password"
}

module "sql_database" {
  depends_on          = [module.sql_server]
  source              = "../Module/azurerm_sql_database"
  sql_database_name   = "todo-infra-sql-db"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  license_type        = "LicenseIncluded"
  max_size_gb         = 2
  sku_name            = "S0"
  sql_server_name     = "todo-infra-sql-server"
  resource_group_name = "todo-infra-rg"
}

module "frontend_vm" {
  depends_on                   = [module.resource_group_name, module.virtual_network_name, module.frontend_subnet, module.frontend_pip, module.key_vault, module.key_rbac, module.kv_username, module.kv_password ]
  source                       = "../Module/azurerm_virtual_machine"
  vm-name                      = "todo-infra-frontend-vm"
  resource_group_name          = "todo-infra-rg"
  location                     = "central India"
  vm_size                      = "Standard_DS1_v2"
  os_disk_caching              = "ReadWrite"
  os_disk_storage_account_type = "Standard_LRS"
  os_disk_name                 = "todo-infra-frontend-osdisk"
  source_image_publisher       = "Canonical"
  source_image_offer           = "0001-com-ubuntu-server-jammy"
  source_image_sku             = "22_04-lts-gen2"
  source_image_version         = "latest"
  nic-name                     = "todo-infra-frontend-nic"
  subnet_name                  = "todo-frontend-subnet"
  pip_name                     = "todo-frontend-pip"
  virtual_network_name         = "todo-infra-vnet"
  key_vault_name               = "todo-infra-dev-keyvault"
  user_name                    = "azureuser"
  password                     = "password"


}


# module "backend_vm" {
#   depends_on                   = [module.resource_group_name, module.virtual_network_name, module.backend_subnet, module.backend_pip]
#   source                       = "../Module/azurerm_virtual_machine"
#   vm-name                      = "todo-infra-backend-vm"
#   resource_group_name          = "todo-infra-rg"
#   location                     = "central India"
#   vm_size                      = "Standard_DS1_v2"
#   admin_username               = "azureuser"
#   admin_password               = "P@ssw0rd1234!"
#   os_disk_caching              = "ReadWrite"
#   os_disk_storage_account_type = "Standard_LRS"
#   os_disk_name                 = "todo-infra-backend-osdisk"
#   source_image_publisher       = "Canonical"
#   source_image_offer           = "0001-com-ubuntu-server-jammy"
#   source_image_sku             = "22_04-lts-gen2"
#   source_image_version         = "latest"
#   nic-name                     = "todo-infra-backend-nic"
#   subnet_name                  = "todo-backend-subnet"
#   pip_name                     = "todo-backend-pip"
#   virtual_network_name         = "todo-infra-vnet"
# }

