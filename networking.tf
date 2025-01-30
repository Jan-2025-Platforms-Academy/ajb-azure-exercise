module "networking" {
  source = "github.com/hmcts/terraform-module-azure-virtual-networking?ref=main"

  env                          = var.env
  product                      = var.product
  common_tags                  = local.tags
  component                    = var.component
  existing_resource_group_name = local.resource_group_name

  vnets = {
    vnet = {
      address_space = [var.vnet_address_range]
      subnets = {
        webapp = {
          address_prefixes = [local.webapp_subnet]
          delegations = {
            webapp = {
              service_name = "Microsoft.Web/serverFarms"
              actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          }
        }
        postgres = {
          address_prefixes = [local.postgres_subnet]
          delegations = {
            flexibleserver = {
              service_name = "Microsoft.DBforPostgreSQL/flexibleServers"
              actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
            }
          }
          service_endpoints = ["Microsoft.Storage"]
        }
        private-endpoints = {
          address_prefixes = [local.private_endpoints_subnet]
        }
      }
    }
  }

  route_tables = {}

  network_security_groups = {}
}
