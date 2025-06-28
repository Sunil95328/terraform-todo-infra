variable "nsg_rule_name" {
  description = "The name of the Network Security Rule."
  type        = string
  
}

variable "nsg_name" {
  description = "The name of the Network Security Group to which this rule belongs."
  type        = string
  
}

variable "priority" {
  description = "The priority of the rule. Lower numbers have higher priority."
  type        = number
  
}

variable "direction" {
  description = "The direction of the rule. Possible values are 'Inbound' or 'Outbound'."
  type        = string
  
}

variable "access" {
  description = "The access level for the rule. Possible values are 'Allow' or 'Deny'."
  type        = string
  
}

variable "protocol" {
  description = "The protocol for the rule. Possible values are 'Tcp', 'Udp', 'Icmp', or '*'."
  type        = string
  
}

variable "source_port_range" {
  description = "The source port range for the rule. Use '*' for all ports."
  type        = string
  
}

variable "destination_port_range" {
  description = "The destination port range for the rule. Use '*' for all ports."
  type        = string
  
}

variable "source_address_prefix" {
  description = "The source address prefix for the rule. Use '*' for all addresses."
  type        = string
  
}

variable "destination_address_prefix" {
  description = "The destination address prefix for the rule. Use '*' for all addresses."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Network Security Group exists."
  type        = string
  
}

