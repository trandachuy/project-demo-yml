provider "azurerm" {
  version = "2.6.0"
  skip_provider_registration = true
  features {}
}

resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.appserviceplanname
  location            = var.region
  resource_group_name = var.resourcegroupname
  kind                = "windows"
  reserved            = false
  sku {
    tier = "Free"
    size = "F1"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_app_service" "frontwebapp" {
  name                = var.appservicename
  location            = var.region
  resource_group_name = var.resourcegroupname
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  lifecycle {
    prevent_destroy = true
  }
}

