resource "azurerm_network_security_group" "nsg" {
  count = "${length(var.nsgs)}"

  name                = "nsg-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.nsgs["nsg${count.index}"], "subnet_role")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "location_short_name")}${lookup(var.nsgs["nsg${count.index}"], "subnet_type")}${count.index + 1}"
  location            = "${lookup(var.commons["common"], "location")}"
  resource_group_name = "${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-01"

  tags = {
    environment = "${lookup(var.commons["common"], "environment_short_name")}"
  }
}
