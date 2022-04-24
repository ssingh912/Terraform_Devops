resource "azurerm_availability_set" "av" {
  count = "${length(var.avs) - 1}"

  name                = "${lookup(var.avs["av${count.index}"], "av_name")}" != "" ? "${lookup(var.avs["av${count.index}"], "av_name")}" : "avs-${lookup(var.avs["common"], "subscription_short_name")}-${lookup(var.avs["common"], "environment_short_name")}-${lookup(var.avs["common"], "application_acronym")}-${lookup(var.avs["common"], "location_short_name")}-0${count.index + 1}"
  location            = "${lookup(var.avs["av${count.index}"], "av_location")}" != "" ? "${lookup(var.avs["av${count.index}"], "av_location")}" : "${lookup(var.avs["common"], "location")}"
  resource_group_name = "${lookup(var.avs["av${count.index}"], "av_rg")}" != "" ? "${lookup(var.avs["av${count.index}"], "av_rg")}" : "${lookup(var.avs["common"], "subscription_short_name")}-rg-${lookup(var.avs["common"], "environment_short_name")}-${lookup(var.avs["common"], "application_acronym")}-${lookup(var.avs["common"], "application_ci")}-1"
  platform_update_domain_count = "${lookup(var.avs["av${count.index}"], "av_update_domain_count")}" != "" ? "${lookup(var.avs["av${count.index}"], "av_update_domain_count")}" : "5"
  platform_fault_domain_count  = "${lookup(var.avs["av${count.index}"], "av_fault_domain_count")}" != "" ? "${lookup(var.avs["av${count.index}"], "av_fault_domain_count")}" : "2"

  tags = {
    environment = "${lookup(var.avs["common"], "environment_short_name")}"
  }
}
