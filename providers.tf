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