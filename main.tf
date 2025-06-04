terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-PiotrC"
    storage_account_name = "stpiotrc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "piotrc-app-service-plan" #change here
  location            = "westeurope"
  resource_group_name = "rg-PiotrC"
  os_type             = "Linux"
  sku_name            = "P0v3"
}


resource "azurerm_linux_web_app" "example" {
  name                = "piotrc-webapp-terraform-app-04062025" #change here
  location            = "westeurope"
  resource_group_name = "rg-PiotrC"
  service_plan_id     = azurerm_service_plan.example.id
  site_config {}
}
