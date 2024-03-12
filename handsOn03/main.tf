terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "JhaatKaChora"
    workspaces {
      name = "ContinuousDelivery"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
# init after this

resource "azurerm_resource_group" "rg" {
  name     = "811-322979db-provide-continuous-delivery-with-gith"
  location = "South Central US"
}


# Making a Storage in Azure
resource "azurerm_storage_account" "storage" {
  name                     = "contdeliverystorageoption1234"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}