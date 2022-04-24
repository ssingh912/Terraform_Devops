variable "nics" {
  default = {
    nic0 = {
      vm_role        = "ap"
      vm_os_type     = "w"
      vm_number      = "01"
      subnet_role    = "ap"
      subnet_type    = "unt"
      subnet_number  = "1"
      allocationtype = "" # default dynamic
    }

    nic1 = {
      vm_role        = "ap"
      vm_os_type     = "w"
      vm_number      = "01"
      subnet_role    = "ap"
      subnet_type    = "unt"
      subnet_number  = "1"
      allocationtype = "" # default dynamic
    }

    nic2 = {
      vm_role        = "ap"
      vm_os_type     = "w"
      vm_number      = "01"
      subnet_role    = "ap"
      subnet_type    = "unt"
      subnet_number  = "1"
      allocationtype = "" # default dynamic
    }

    nic3 = {
      vm_role        = "ap"
      vm_os_type     = "w"
      vm_number      = "01"
      subnet_role    = "ap"
      subnet_type    = "unt"
      subnet_number  = "1"
      allocationtype = "" # default dynamic
    }

  }

}

output "nics" {
  value = "${var.nics}"
}
