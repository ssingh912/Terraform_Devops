variable "datadisks" {
  default = {
    datadisk0 = {
      vm_role              = "ap"
      vm_os_type           = "w"
      vm_number            = "01"
      disk_name            = ""
      datadisk_location    = ""
      datadisk_rg          = ""
      storage_account_type = ""
      create_option        = ""
      disk_size_gb         = "100"

    }

    datadisk1 = {
      vm_role              = "ap"
      vm_os_type           = "w"
      vm_number            = "01"
      disk_name            = ""
      datadisk_location    = ""
      datadisk_rg          = ""
      storage_account_type = ""
      create_option        = ""
      disk_size_gb         = "100"

    }

  }

}

variable "commons" {
  default = {
    common = {
      subscription_short_name = ""
      environment_short_name  = ""
      application_acronym     = ""
      application_ci          = ""
      location                = ""
      location_short_name     = ""
    }
  }
}
