locals {
  name                = "${var.product}-${var.component}-${var.env}"
  resource_group_name = var.existing_resource_group_name != null ? var.existing_resource_group_name : azurerm_resource_group.this[0].name
  tags = merge(
    var.tags,
    {
      "product"     = var.product
      "component"   = var.component
      "environment" = var.env
      "deployed-by" = data.azurerm_client_config.current.object_id
    }
  )

  webapp_subnet            = var.webapp_subnet_address_prefix != null ? var.webapp_subnet_address_prefix : cidrsubnet(var.vnet_address_range, 3, 0)
  postgres_subnet          = var.postgres_subnet_address_prefix != null ? var.postgres_subnet_address_prefix : cidrsubnet(var.vnet_address_range, 3, 1)
  private_endpoints_subnet = var.private_endpoints_subnet_address_prefix != null ? var.private_endpoints_subnet_address_prefix : cidrsubnet(var.vnet_address_range, 3, 2)
}

data "azurerm_client_config" "current" {}
