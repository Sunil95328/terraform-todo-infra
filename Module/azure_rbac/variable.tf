variable "key_vault_name" {
  description = "The name of the Key Vault to create."
  type        = string
  
}


variable "resource_group_name" {
  description = "The name of the Resource Group in which the Key Vault should exist."
  type        = string
  
}
  
variable "role_definition_name" {
  description = "The name of the role definition to assign."
  type        = string
}

variable "principal_id" {
  description = "The principal ID (user, group, or service principal) to assign the role to."
  type        = string
}

