resource "azurerm_managed_disk" "datadisk" {
  count = "${length(var.datadisks) - 1}"

  name                 = "${lookup(var.datadisks["datadisk${count.index}"], "vm_os_type")}${lookup(var.commons["common"], "subscription_short_name")}${lookup(var.commons["common"], "application_acronym")}${lookup(var.commons["common"], "environment_short_name")}${lookup(var.datadisks["datadisk${count.index}"], "vm_role")}${lookup(var.datadisks["datadisk${count.index}"], "vm_number")}-datadisk-${count.index + 1}"
  location             = "${lookup(var.commons["common"], "location")}"
  resource_group_name  = "${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-01"
  storage_account_type =  "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "${lookup(var.datadisks["datadisk${count.index}"], "disk_size_gb")}" != "" ? "${lookup(var.datadisks["datadisk${count.index}"], "disk_size_gb")}" : "10"

  tags = {
    environment = "${lookup(var.commons["common"], "environment_short_name")}"
  }
}
