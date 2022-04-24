variable "subnets" {
  default = {
    subnet0 = {
      subnet_role  = "ap"
      subnet_type  = "unt"
      vnet_number  = "1"
      subnet_space = ["10.0.0.0/24", "10.0.2.0/24"]

    }

    subnet1 = {
      subnet_role  = "ap"
      subnet_type  = "unt"
      vnet_number  = "1"
      subnet_space = ["10.0.0.0/16"]

    }
    subnet2 = {
      subnet_role  = "ap"
      subnet_type  = "unt"
      vnet_number  = "1"
      subnet_space = ["172.16.0.0/16"]

    }

  }

}

output "subnets" {
  value = "${var.subnets}"
}