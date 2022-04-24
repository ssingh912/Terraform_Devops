resource "azurerm_network_security_rule" "nsgrule" {
  count = "${length(var.nsgs)}"
  
  name                        = "${lookup(var.nsgrules["nsgrule${count.index}"], "rulename")}"
  priority                    = "${lookup(var.nsgrules["nsgrule${count.index}"], "priority")}"
  direction                   = "${lookup(var.nsgrules["nsgrule${count.index}"], "direction")}"
  access                      = "${lookup(var.nsgrules["nsgrule${count.index}"], "access")}"
  protocol                    = "${lookup(var.nsgrules["nsgrule${count.index}"], "protocol")}"
  source_port_range           = "${lookup(var.nsgrules["nsgrule${count.index}"], "source_port_range")}"
  destination_port_range      = "${lookup(var.nsgrules["nsgrule${count.index}"], "dest_port_range")}"
  source_address_prefix       = "${lookup(var.nsgrules["nsgrule${count.index}"], "source_address_prefix")}"
  destination_address_prefix  = "${lookup(var.nsgrules["nsgrule${count.index}"], "dest_address_prefix")}"
  resource_group_name         = "${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-01"
  network_security_group_name = "nsg-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.nsgrules["nsgrule${count.index}"], "subnet_role")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "location_short_name")}${lookup(var.nsgrules["nsgrule${count.index}"], "subnet_type")}${lookup(var.nsgrules["nsgrule${count.index}"], "nsg_number")}"
}
