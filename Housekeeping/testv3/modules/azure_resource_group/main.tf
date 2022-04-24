provider "azurerm"{
    
 skip_provider_registration = true
 
 subscription_id = "${lookup(var.commons["common"], "subscription_id")}"
 alias = "resourcegroup"
 features {}

}

resource "azurerm_resource_group" "rg" {
  count = "${length(var.rgs)}"

  name     = "rgp-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "location_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${count.index + 1}"
  location = "${lookup(var.commons["common"], "location")}"

  tags = {
    environment = "${lookup(var.commons["common"], "environment_short_name")}"
  }
}
