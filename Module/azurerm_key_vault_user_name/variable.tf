variable "key_vault_name" {
  description = "The name of the Key Vault to create."
  type        = string
  
}


variable "resource_group_name" {
  description = "The name of the Resource Group in which the Key Vault should exist."
  type        = string
  
}   

variable "user_name" {
  description = "The name of the user for whom the secret is being created."
  type        = string
  
}

variable "user_name_value" {
  
}




