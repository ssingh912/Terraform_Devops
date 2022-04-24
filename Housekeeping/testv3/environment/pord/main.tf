module "azure_resource_group" {
  source = "../../modules/azure_resource_group"

  rgs     = "${var.rgs}"
  commons = "${var.commons}"
}

// module "azure_virtual_network" {
//   source = "../../modules/azure_virtual_network"

//   vnets = "${var.vnets}"
//   commons="${var.commons}"
// }

# module "azure_virtual_subnet" {
#   source = "../../modules/azure_virtual_subnet"

#   subnets = "${var.subnets}"
#   commons="${var.commons}"
# }

# module "azure_network_security_group" {
#   source = "../../modules/azure_network_security_group"

#   nsgs = "${var.nsgs}"
#   nsgrules="${var.nsgrules}"
#   commons="${var.commons}"

# }

# module "azure_keyvault" {
#   source = "../../modules/azure_keyvault"

#   akvs = "${var.akvs}"
#   commons="${var.commons}"
# }

 module "azure_storage_account" {
   source = "../../modules/azure_storage_account"

   sas = "${var.sas}"
   commons="${var.commons}"
 }

# module "azure_manage_disk" {
#   source = "../../modules/azure_manage_disk"

#   datadisks = "${var.datadisks}"
#   commons="${var.commons}"
# }

# module "azure_network_interface" {
#   source = "../../modules/azure_network_interface"

#   nics = "${var.nics}"
#   commons="${var.commons}"
# }




