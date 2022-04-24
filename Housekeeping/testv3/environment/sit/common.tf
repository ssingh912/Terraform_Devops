variable "commons" {
  default = {
    common = {
      subscription_short_name = "tdsit"
      environment_short_name  = "st"
      application_acronym     = "dat"
      application_ci          = "datpl"
      location                = "westindia"
      location_short_name     = "wi"
    }
    }
}

output "commons" {
  value = "${var.commons}"
}
