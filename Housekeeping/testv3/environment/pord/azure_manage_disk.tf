variable "datadisks" {
  default = {
    datadisk0 = {
      vm_role      = "ap"
      vm_os_type   = "w"
      vm_number    = "1"
      disk_size_gb = "100"

    }

    datadisk1 = {
      vm_role      = "ap"
      vm_os_type   = "w"
      vm_number    = "1"
      disk_size_gb = "100"

    }

  }

}

output "datadisks" {
  value = "${var.datadisks}"
}

