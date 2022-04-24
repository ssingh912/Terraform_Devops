data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "akv" {
  count = "${length(var.akvs)}"
  
  name                        = "akv-${lookup(var.commons["common"], "subscription_short_name")}-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "location_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${count.index + 1}"
  location                    = "${lookup(var.commons["common"], "location")}"
  resource_group_name         = "${lookup(var.commons["common"], "subscription_short_name")}-rg-${lookup(var.commons["common"], "environment_short_name")}-${lookup(var.commons["common"], "application_acronym")}-${lookup(var.commons["common"], "application_ci")}-01"
  enabled_for_disk_encryption =  true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         =  true
  purge_protection_enabled    =  false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore"]
    secret_permissions = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
    storage_permissions = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = "${lookup(var.commons["common"], "environment_short_name")}"
  }
}

