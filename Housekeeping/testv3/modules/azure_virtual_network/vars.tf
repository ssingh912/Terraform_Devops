variable "vnets" {
  default = {
    vnet0 = {
      vnet_name               = ""
      vnet_location           = ""
      vnet_rg                 = ""
      vnet_space              = "10.0.0.0/16"

    }

    vnet1 = {
      vnet_name               = ""
      vnet_location           = ""
      vnet_rg                 = ""
      vnet_space              = "10.0.0.0/16"

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
