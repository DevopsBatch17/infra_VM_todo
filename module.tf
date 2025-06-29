## This file is used to define the Terraform modules and their dependencies.
# It includes the required providers, backend configuration, and module sources.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = "rg-pateriya"
      storage_account_name = "pateriyastg"
      container_name       = "pateriya"
      key                  = "rahul.tfstate"

    }
}

provider "azurerm" {
  features {}
  subscription_id = "fb85801b-367a-4ef8-8b37-eaf7a1f71813"
}

module "rg" {
  source = "D:\\DevOps\\Terraform Code\\Resource_group"
}

module "stg" {
  depends_on = [module.rg]
  source     = "D:\\DevOps\\Terraform Code\\Storage_Account"

}

module "rpcontainer" {
  depends_on = [module.stg]
  source = "D:\\DevOps\\Terraform Code\\Container"
}