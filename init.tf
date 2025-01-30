terraform {
  required_version = "1.10.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.15.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstated38fa016777f"
    container_name       = "tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "azuread" {
  tenant_id = data.azurerm_client_config.current.tenant_id
}

provider "random" {}
