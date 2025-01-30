variable "location" {
  description = "Target Azure location to deploy resources into"
  type        = string
  default     = "uksouth"
}

variable "product" {
  description = "The name of the product being deployed"
  type        = string
  default     = "kpa-ajb"
}

variable "component" {
  description = "The name of the component being deployed"
  type        = string
  default     = "webapp"
}

variable "existing_resource_group_name" {
  description = "The name of an existing resource group to deploy into"
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "webapp_subnet_address_prefix" {
  description = "The address prefix for the webapp subnet"
  type        = string
  default     = null
}

variable "postgres_subnet_address_prefix" {
  description = "The address prefix for the postgres subnet"
  type        = string
  default     = null
}

variable "private_endpoints_subnet_address_prefix" {
  description = "The address prefix for the private endpoints subnet"
  type        = string
  default     = null
}
