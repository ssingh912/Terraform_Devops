variable "nics" {
  default = {
    nic0 = {
      subnet_role               = "ap"
      subnet_type               = "unt"
      subnet_number            =""
      nicname        = ""
      nicrg          = ""
      niclocation    = ""
      ipname         = ""
      subnetid       = "/subscriptions/7dc72ad9-3af8-4c19-bfb3-0e85c5e10d1b/resourceGroups/WeEu-S00-Dev-Rsg-Navi-01/providers/Microsoft.Network/virtualNetworks/WeEu-Pla-Dev-Rsg-Navi-01-vnet/subnets/default"
      allocationtype = "Dynamic"

    }

    nic1 = {
      subnet_role               = "ap"
      subnet_type               = "unt"
      subnet_number             =""
      nicname        = "playground-nic-02"
      nicrg          = "WeEu-S00-Dev-Rsg-Navi-01"
      niclocation    = "westindia"
      ipname         = "internal"
      subnetid       = "/subscriptions/7dc72ad9-3af8-4c19-bfb3-0e85c5e10d1b/resourceGroups/WeEu-S00-Dev-Rsg-Navi-01/providers/Microsoft.Network/virtualNetworks/WeEu-Pla-Dev-Rsg-Navi-01-vnet/subnets/default"
      allocationtype = "Dynamic"

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
