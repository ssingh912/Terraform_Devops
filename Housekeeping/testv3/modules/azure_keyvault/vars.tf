variable "akvs" {
  default = {
    akv0 = {
      akv_name =""
      akv_rg =""
      akv_location =""
      enabled_for_disk_encryption = ""
      soft_delete_enabled =""
      purge_protection_enabled =""
      sku_name =""      
    }

    akv1 = {
      akv_name =""
      akv_rg =""
      akv_location =""
      enabled_for_disk_encryption = ""
      soft_delete_enabled =""
      purge_protection_enabled =""
      sku_name =""
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
