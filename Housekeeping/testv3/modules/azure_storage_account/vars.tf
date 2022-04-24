variable "sas" {
  default = {
    sa0 = {
      sa_name =""
      sa_rg =""
      sa_location =""
      account_tire=""
      sa_replication_type=""
      enable_hierachical_namespace =""

    }

    sa1 = {
      sa_name =""
      sa_rg =""
      sa_location =""
      account_tire=""
      sa_replication_type=""
      enable_hierachical_namespace =""

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
