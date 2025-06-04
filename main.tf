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
  name                = "piotrc-app-service-plan"
  location            = "westeurope"
  resource_group_name = "rg-PiotrC"
  os_type             = "Linux"
  sku_name            = "P0v3"
}

resource "azurerm_linux_web_app" "example" {
  name                = "piotrc-webapp-terraform-app"
  location            = "westeurope"
  resource_group_name = "rg-PiotrC"
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}

resource "azurerm_linux_web_app" "backend" {
  name                = "piotrc-backend-app"
  location            = "westeurope"
  resource_group_name = "rg-PiotrC"
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    application_stack {
      docker_image_name   = "${var.acr_login_server}/backend-webapp:latest"
      docker_registry_url = "https://${var.acr_login_server}"
    }
  }
}

resource "azurerm_linux_web_app" "frontend" {
  name                = "piotrc-frontend-app"
  location            = "westeurope"
  resource_group_name = "rg-PiotrC"
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    application_stack {
      docker_image_name   = "${var.acr_login_server}/frontend-webapp:latest"
      docker_registry_url = "https://${var.acr_login_server}"
    }
  }
}
