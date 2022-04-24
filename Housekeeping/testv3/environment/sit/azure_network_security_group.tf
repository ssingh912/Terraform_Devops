variable "nsgs" {
  default = {
    nsg0 = {
      subnet_role ="ap"
      subnet_type ="share"      
    }
    nsg1 = {
      subnet_role ="ap"
      subnet_type ="share"      
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
      source_address_prefix ="10.0.0.0/24,10.0.3.0/24"
      dest_address_prefix ="10.0.1.0/24"

    }
  }
  
}

output "nsgs" {
  value = "${var.nsgs}"
}

output "nsgrules" {
  value = "${var.nsgrules}"
}
