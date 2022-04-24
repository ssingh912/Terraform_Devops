variable "nsgs" {
  default = {
    nsg0 = {
      subnet_role =""
      subnet_type =""
      nsg_name =""
      nsg_rg =""
      nsg_location =""
      
    }
 
  }

}

variable "nsgrules" {
  default = {
    nsgrule0 = {
      subnet_role ="ap"
      subnet_type ="share"
      nsg_number  =1
      rulename ="Allow-jump-to-pymt-https"
      priority ="1100"
      direction ="Inbound"
      access  ="Allow"
      protocol ="TCP"
      source_port_range ="*"
      dest_port_range = "443"
      source_address_prefix ="10.0.0.0/24"
      dest_address_prefix ="10.0.1.0/24"

    }
    nsgrule1 = {
      subnet_role ="ap"
      subnet_type ="share"
      nsg_number  =1
      rulename ="Allow-jump-to-pymt-http"
      priority ="1100"
      direction ="Inbound"
      access  ="Allow"
      protocol ="TCP"
      source_port_range ="*"
      dest_port_range = "80"
      source_address_prefix ="10.0.0.0/24"
      dest_address_prefix ="10.0.1.0/24"

    }
    nsgrule2 = {
      subnet_role ="ap"
      subnet_type ="share"
      nsg_number  =1
      nsg_rg=""
      nsg_name=""
      rulename ="Allow-jump-to-pymt-http"
      priority ="1100"
      direction ="Inbound"
      access  ="Allow"
      protocol ="TCP"
      source_port_range ="*"
      dest_port_range = "80"
      source_address_prefix ="10.0.0.0/24"
      dest_address_prefix ="10.0.1.0/24"

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