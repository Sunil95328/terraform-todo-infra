variable "nsg_name" {
  description = "The name of the Network Security Group."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Network Security Group will be created."
  type        = string
  
}
variable "location" {
  description = "The Azure region where the Network Security Group will be created."
  type        = string
  
}
