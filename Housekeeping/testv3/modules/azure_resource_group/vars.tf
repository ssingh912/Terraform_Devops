variable "rgs" {
  default = {
    rg0 = {
      rgname     = ""
      rglocation = ""

    }

    rg1 = {
      rgname     = ""
      rglocation = ""

    }
    rg2 = {
      rgname     = ""
      rglocation = ""
    }

  }

}


variable "commons" {
  default = {
    common = {
      subscription_short_name = ""
      environment_short_name  = ""
      application_acronym     = ""
      location                = ""
      location_short_name     = ""
      subscription_id         = ""
    }
    }
}
