terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
}


provider "azurerm" {
  features {}
  skip_provider_registration = true
}
# init after this

resource "azurerm_resource_group" "rg" {
  name     = "809-edab04bc-deploy-to-azure-using-the-terraform-c"
  location = "West US"
}

# Making a Storage in Azure
resource "azurerm_storage_account" "storage" {
  name                     = "mystorage001xyx"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}