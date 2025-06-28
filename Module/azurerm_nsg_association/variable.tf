variable "subnet_name" {
  description = "The name of the subnet to which the Network Security Group will be associated."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Network Security Group will be associated."
  type        = string
  
}

variable "virtual_network_name" {
  description = "The name of the virtual network to which the subnet belongs."
  type        = string  
  
}

variable "nsg_name" {
  description = "The name of the Network Security Group to associate with the subnet."
  type        = string
  
}   