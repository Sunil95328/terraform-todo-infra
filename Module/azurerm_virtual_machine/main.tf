data "azurerm_subnet" "data_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}


data "azurerm_public_ip" "data_pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}



resource "azurerm_network_interface" "dev-nic" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.data_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "dev-frontend-vm" {
  depends_on          = [azurerm_network_interface.dev-nic]
  name                = var.vm-name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password      = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false
    network_interface_ids = [
    azurerm_network_interface.dev-nic.id,
  ]


  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }
  # custom_data = base64encode(<<-EOF
  #             #!/bin/bash
  #             sudo apt-get update
  #             sudo apt-get install -y nginx
  #             sudo systemctl enable nginx
  #             sudo systemctl start nginx
  #             EOF
  # )
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type     = "ssh"
      user     = data.azurerm_key_vault_secret.username.value
      password = data.azurerm_key_vault_secret.password.value
      host     = data.azurerm_public_ip.data_pip.ip_address
    }
  }
}