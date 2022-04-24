resource "azurerm_virtual_network" "vnet" {
  count = "${length(var.vnets)}"

  name                = "vnet-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "location")}-${count.index + 1}"
  location            = "${lookup(var.commons["common"], "location")}"
  resource_group_name = "${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-01"
  address_space       = "${lookup(var.vnets["vnet${count.index}"], "vnet_space")}"
  #dns_servers         = "${lookup(var.vnets["vnet${count.index}"], "vnet_space")}"


  tags = {
    environment = "${lookup(var.commons["common"], "environment_short_name")}"
  }
}

