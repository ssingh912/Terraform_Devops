variable "vmws" {
  default = {
    common = {
      subscription_short_name = "s03"
      environment_short_name  = "Dev"
      application_acronym     = "dat"
      application_ci          = "datpl"
      location                = "westindia"
    }
    vmw0 = {
      vmw_name               = ""
      vmw_location               = ""
      vmw_rg               = ""
      vmw_size               = ""
      subnet_rg                 = ""
      subnet_space              = "10.0.0.0/16"

    }

    vmw1 = {
      subnet_role               = "ap"
      subnet_type               = "unt"
      vnet_number               = ""
      subnet_name               = ""
      subnet_rg                 = ""
      subnet_space              = "10.0.0.0/16"

    }

  }

}
