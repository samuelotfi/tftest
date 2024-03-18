terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
    subscription_id = "7617f663-628c-4ada-9e64-f1f060e2de9b" # my sub id
    tenant_id       = "9974da4c-818b-466c-8bd3-0c49e5467345" # my tenant id
    #client_id         = "fd9e9497-e0ca-40f3-9e5f-0be13c520917"
    #client_secret     = "<service_principal_password>"


}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "East US"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstatestorage"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # allow_blob_public_access = true

}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}

