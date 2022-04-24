data "azurerm_subscription" "current" {
}

output "current_subscription_id" {
  value = data.azurerm_subscription.current.id
}

data "azurerm_availability_set" "av" {
  name = "avs-${lookup(var.avs["common"], "subscription_short_name")}-${lookup(var.avs["common"], "environment_short_name")}-${lookup(var.avs["common"], "application_acronym")}-${lookup(var.avs["common"], "location_short_name")}-01"
  resource_group_name = "${lookup(var.vmws["vmw${count.index}"], "vmw_rg")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_rg")}" : "${lookup(var.vmws["common"], "subscription_short_name")}-rg-${lookup(var.vmws["common"], "environment_short_name")}-${lookup(var.vmws["common"], "application_acronym")}-${lookup(var.vmws["common"], "application_ci")}-1"
}

output "availability_set_id" {
  value = data.azurerm_availability_set.av.id
}

resource "azurerm_virtual_machine" "vmw" {
  count = "${length(var.vmws) - 1}"

  name                  = "${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" : "W${lookup(var.vmws["common"], "subscription_short_name")}${lookup(var.vmws["common"], "application_acronym")}${lookup(var.vmws["common"], "environment_short_name")}-${lookup(var.vmws["vmw${count.index}"], "vm_role")}0${count.index + 1}"
  location              = "${lookup(var.vmws["vmw${count.index}"], "vmw_location")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_location")}" : "${lookup(var.vmws["common"], "location")}"
  resource_group_name   = "${lookup(var.vmws["vmw${count.index}"], "vmw_rg")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_rg")}" : "${lookup(var.vmws["common"], "subscription_short_name")}-rg-${lookup(var.vmws["common"], "environment_short_name")}-${lookup(var.vmws["common"], "application_acronym")}-${lookup(var.vmws["common"], "application_ci")}-1"
  network_interface_ids = "/subscriptions/${current_subscription_id}/resourceGroups/"${lookup(var.vmws["vmw${count.index}"], "vmw_rg")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_rg")}" : "${lookup(var.vmws["common"], "subscription_short_name")}-rg-${lookup(var.vmws["common"], "environment_short_name")}-${lookup(var.vmws["common"], "application_acronym")}-${lookup(var.vmws["common"], "application_ci")}-1"/providers/Microsoft.Network/networkInterfaces/"${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" : "W${lookup(var.vmws["common"], "subscription_short_name")}${lookup(var.vmws["common"], "application_acronym")}${lookup(var.vmws["common"], "environment_short_name")}-${lookup(var.vmws["vmw${count.index}"], "vm_role")}0${count.index + 1}"-nic0${count.index + 1}"
  vm_size               = "${lookup(var.vmws["vmw${count.index}"], "vmw_size")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_size")}" : "Standard_DS1_v2"
  delete_os_disk_on_termination = false
  delete_data_disks_on_termination = false

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" : "W${lookup(var.vmws["common"], "subscription_short_name")}${lookup(var.vmws["common"], "application_acronym")}${lookup(var.vmws["common"], "environment_short_name")}-${lookup(var.vmws["vmw${count.index}"], "vm_role")}0${count.index + 1}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" != "" ? "${lookup(var.vmws["vmw${count.index}"], "vmw_name")}" : "W${lookup(var.vmws["common"], "subscription_short_name")}${lookup(var.vmws["common"], "application_acronym")}${lookup(var.vmws["common"], "environment_short_name")}-${lookup(var.vmws["vmw${count.index}"], "vm_role")}0${count.index + 1}"
    admin_username = "${lookup(var.vmws["common"], "subscription_short_name")}vmadmin"
    admin_password = "${lookup(var.vmws["common"], "subscription_short_name")}@dm!n321"
  }
  os_profile_windows_config {
    availability_set_id ="${availability_set_id}"
    provision_vm_agent = true
  }
  boot_diagnostics {
    enabled = true

    storage_uri = "http://"sta${lookup(var.vmws["common"], "subscription_short_name")}${lookup(var.vmws["common"], "environment_short_name")}${lookup(var.vmws["common"], "location_short_name")}${lookup(var.vmws["common"], "application_acronym")}"lrs1.blob.core.windows.net"
}
  tags = {
    environment = "${lookup(var.vmws["common"], "environment_short_name")}"
  }
}

