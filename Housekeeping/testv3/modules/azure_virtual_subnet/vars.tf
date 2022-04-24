variable "subnets" {
  default = {
    subnet0 = {
      subnet_role               = "ap"
      subnet_type               = "unt"
      vnet_number               = ""
      subnet_name               = ""
      subnet_rg                 = ""
      subnet_space              = "10.0.0.0/16"

    }

    subnet1 = {
      subnet_role               = "ap"
      subnet_type               = "unt"
      vnet_number               = ""
      subnet_name               = ""
      subnet_rg                 = ""
      subnet_space              = "10.0.0.0/16"

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
