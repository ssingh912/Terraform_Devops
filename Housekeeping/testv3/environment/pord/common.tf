variable "commons" {
  default = {
    common = {
      subscription_short_name = "tdldr"
      environment_short_name  = "dr"
      application_acronym     = "aai"
      location                = "south india"
      location_short_name     = "si"
      subscription_id         = "c15bb605-8719-46dd-9210-00493356719a"
    }
  }
}

output "commons" {
  value = "${var.commons}"
}

