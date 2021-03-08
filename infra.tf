provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}

#Compliance Landing Zone For company, Production 
resource "azurerm_resource_group" "tfex-cosmosdb-account-rg" {
  name     = "RGtestxx01"
  location = "East US"
  tags = {
    Ambiente = "${local.production}"
    Area = "Test"
    Empresa = "${local.company}"
  }
}

resource "azurerm_storage_account" "stgprod" {
  name                     = "stactestxx01"
  resource_group_name      = "${azurerm_resource_group.tfex-cosmosdb-account-rg.name}"
  location                 = "${azurerm_resource_group.tfex-cosmosdb-account-rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Ambiente = "${local.production}"
    Area = "TEst"
    Empresa = "${local.company}"
  }
}

#cosmodb
data "azurerm_cosmosdb_account" "example" {
  location = "East US"
  name                = "tfex-cosmosdb-account"
  resource_group_name = "tfex-cosmosdb-account-rg"
}

resource "azurerm_cosmosdb_mongo_database" "example" {
  location = "East US"
  name                = "tfex-cosmos-mongo-db"
  resource_group_name = data.azurerm_cosmosdb_account.example.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.example.name
}

resource "azurerm_cosmosdb_mongo_collection" "example" {
  location = "East US"
  name                = "tfex-cosmos-mongo-db"
  resource_group_name = data.azurerm_cosmosdb_account.example.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.example.name
  database_name       = azurerm_cosmosdb_mongo_database.example.name

  default_ttl_seconds = "777"
  shard_key           = "uniqueKey"
  throughput          = 400
}

