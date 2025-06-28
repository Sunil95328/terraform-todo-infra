variable "key_vault_name" {
  description = "The name of the Key Vault to create."
  type        = string
  
}


variable "resource_group_name" {
  description = "The name of the Resource Group in which the Key Vault should exist."
  type        = string
  
}   



variable "password" {
  description = "The password for the user."
  type        = string
  sensitive   = true
  
}

variable "password_value" {
  description = "The value of the password secret."
  type        = string
  sensitive   = true
  
}
