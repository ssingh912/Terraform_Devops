provider "azurerm" {
  features {}
  skip_provider_registration = true
  version = "=2.19.0"
}
terraform {
  required_version = ">=0.12"
}
 
resource "azurerm_storage_account" "sa" {
  count = "${length(var.sas)}"

  name                     = "sta${lookup(var.commons["common"], "subscription_short_name")}${lookup(var.commons["common"], "environment_short_name")}${lookup(var.commons["common"], "location_short_name")}${lookup(var.commons["common"], "application_acronym")}${lookup(var.sas["sa${count.index}"], "sa_replication_type")}${count.index + 1}"
  resource_group_name      = "rgp-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "location_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${count.index + 1}"
  location                 = "${lookup(var.commons["common"], "location")}"
  account_tier             = "Standard"
  account_replication_type = "${lookup(var.sas["sa${count.index}"], "sa_replication_type")}" != "" ? "${lookup(var.sas["sa${count.index}"], "sa_replication_type")}" : "lrs"
  
  tags = {
    environment = "${lookup(var.commons["common"], "environment_short_name")}"
  }
}

