variable "subnet_name" {
  description = "The name of the subnet to create."
  type        = string
  
}

variable "virtual_network_name" {
  description = "The name of the virtual network where the subnet will be created."
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the subnet will be created."
  type        = string
  
}
variable "location" {
  description = "The Azure region where the subnet will be created."
  type        = string
  default     = "East US"
}
variable "address_prefix" {
  description = "The address prefix for the subnet."
    type        = list(string)
  
}