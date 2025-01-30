variable "env" {
  description = "The name of the environment"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "vnet_address_range" {
  description = "The address range for the VNet."
  type        = string
}
