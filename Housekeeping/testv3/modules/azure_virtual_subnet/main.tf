resource "azurerm_subnet" "subnet" {
  count = "${length(var.subnets)}"

  name                 = "snt-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.subnets["subnet${count.index}"], "subnet_role")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.subnets["subnet${count.index}"], "subnet_type")}-${lookup(var.commons["common"], "location")}-${count.index + 1}"
  resource_group_name  = "${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-01"
  virtual_network_name = "vnet-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "location")}-${lookup(var.subnets["subnet${count.index}"], "vnet_number")}"
  address_prefixes     = "${lookup(var.subnets["subnet${count.index}"], "subnet_space")}"

}
