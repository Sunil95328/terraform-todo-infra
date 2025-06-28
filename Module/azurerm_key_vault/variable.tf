variable "key_vault_name" {
  description = "The name of the Key Vault to create."
  type        = string      
  
}

variable "location" {
  description = "The Azure Region where the Key Vault should exist."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Key Vault should exist."
  type        = string
  
}

variable "sku_name" {
  description = "The SKU name of the Key Vault. Possible values are 'standard' and 'premium'."
  type        = string
  
  
}