variable "sql_database_name" {
  description = "The name of the SQL Database."
  type        = string

}


variable "collation" {
  description = "The collation of the SQL Database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  
}

variable "license_type" {
  description = "The license type for the SQL Database."
  type        = string
  default     = "LicenseIncluded"   
  
}

variable "max_size_gb" {
  description = "The maximum size of the SQL Database in GB."
  type        = number
  default     = 2
  
}

variable "sku_name" {
  description = "The SKU name for the SQL Database."
  type        = string
  default     = "S0"
  
}

variable "sql_server_name" {
  description = "The name of the SQL Server where the database will be created."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the SQL Database should exist."
  type        = string
  
}