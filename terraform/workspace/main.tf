terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.16"
    }

    databricks = {
      source = "databricks/databricks"
      version = ">= 1.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "base" {
  name     = "dlevy-anz-ide-rg"
  location = "Australia East"
}

resource "azurerm_databricks_workspace" "workspace" {
  name                = "dlevy-anz-ide-ws"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  sku                 = "premium"

  tags = {
    Owner = "dlevy@databricks.com"
    Environment = "Production"
  }
}

provider "databricks" {
  host = "https://${azurerm_databricks_workspace.workspace.workspace_url}/"
}

resource "databricks_repo" "aspd" {
  url = "https://github.com/databricks-academy/apache-spark-programming-with-databricks"
}


data "databricks_node_type" "small" {
  local_disk = true
  min_cores   = 8
  gb_per_core = 2
}

// Get the latest Spark version to use for the cluster.
data "databricks_spark_version" "latest" {}


resource "databricks_cluster" "mosaic_cluster" {
  cluster_name  = "development"
  num_workers   = 3
  spark_version = data.databricks_spark_version.latest.id
  //node_type_id  = data.databricks_node_type.small.id
  node_type_id = "Standard_DS4_v2"
}

// Print the URL to the job.
output "job_url" {
  value = azurerm_databricks_workspace.workspace.workspace_url
}


