provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-example-dev-southafricanorth"
  location = "southafricanorth"
}

module "storage" {
  source = "../.."

  project_name        = "example"
  environment         = "dev"
  owner               = "Yasin"
  resource_group_name = azurerm_resource_group.example.name

  storage_accounts = {
    syslog = {
      containers = ["syslog"]
    }
  }
}