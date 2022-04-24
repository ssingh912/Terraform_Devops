data "azurerm_subscription" "current" {
}


resource "azurerm_network_interface" "nic" {
  count = "${length(var.nics)}"

  name                = "${lookup(var.nics["nic${count.index}"], "vm_os_type")}${lookup(var.commons["common"], "subscription_short_name")}${lookup(var.commons["common"], "application_acronym")}${lookup(var.commons["common"], "environment_short_name")}${lookup(var.nics["nic${count.index}"], "vm_role")}${lookup(var.nics["nic${count.index}"], "vm_number")}-nic${count.index + 1}"
  location            = "${lookup(var.commons["common"], "location")}"
  resource_group_name = "${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-01"

  ip_configuration {
    name                          = "ipconfig${count.index + 1}"
    subnet_id                     = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-1/providers/Microsoft.Network/virtualNetworks/vnet-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "location")}-1/subnets/snt-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.nics["nic${count.index}"], "subnet_role")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.nics["nic${count.index}"], "subnet_type")}-${lookup(var.commons["common"], "location")}-${lookup(var.nics["nic${count.index}"], "subnet_number")}"
    private_ip_address_allocation = "${lookup(var.nics["nic${count.index}"], "allocationtype")}" != "" ? "${lookup(var.nics["nic${count.index}"], "allocationtype")}" : "Dynamic"
  }
  tags = {
    environment = "${lookup(var.commons["common"], "environment_short_name")}"
  }
}
