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
      name = "example-workspace"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
# init after this

resource "azurerm_resource_group" "rg" {
  name     = "810-9b232467-migrate-terraform-state-to-terraform"
  location = "East US"
}
