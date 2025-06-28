
variable "nic-name" {
    description = "The name of the Network Interface Card (NIC) for the virtual machine."
    type        = string
  
}


variable "vm-name" {
  description = "The name of the SQL Server."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the SQL Server will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the SQL Server will be created."
  type        = string
}
     

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  
}

variable "os_disk_name" {
  description = "The name of the OS disk for the virtual machine."
  type        = string
  
}
variable "os_disk_caching" {
  description = "The caching type for the OS disk."
  type        = string
  
}
variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk."
  type        = string

}
variable "source_image_publisher" {
  description = "The publisher of the source image for the virtual machine."
  type        = string
  
}
variable "source_image_offer" {
  description = "The offer of the source image for the virtual machine."
  type        = string
  
}
variable "source_image_sku" {
  description = "The SKU of the source image for the virtual machine."
  type        = string
  
}
variable "source_image_version" {
  description = "The version of the source image for the virtual machine."
  type        = string
  
}


variable "subnet_name" {
  description = "The name of the frontend subnet."
  type        = string
}


variable "virtual_network_name" {
  description = "The name of the virtual network where the subnets are located."
  type        = string
}

variable "pip_name" {
  description = "The name of the public IP address for the frontend."
  type        = string
}

variable "key_vault_name" {
  
}

variable "user_name" {
  description = "The username for the virtual machine."
  type        = string
}

variable "password" {
  description = "The password for the virtual machine."
  type        = string
  sensitive   = true
}