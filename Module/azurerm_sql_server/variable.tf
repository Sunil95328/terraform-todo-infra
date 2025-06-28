variable "sql_server_name" {
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


variable "server_version" {
  description = "The version of the SQL Server."
  type        = string
  default     = "12.0"
}

variable "key_vault_name" {
  description = "The name of the Key Vault where the SQL Server credentials will be stored."
  type        = string
  
}

variable "user_name" {
  
}

variable "password" {
  
}