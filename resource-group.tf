resource "azurerm_resource_group" "this" {
  count    = var.existing_resource_group_name == null ? 1 : 0
  name     = "${local.name}-rg"
  location = var.location
  tags     = local.tags
}
