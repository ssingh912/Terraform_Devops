variable "vnets" {
  default = {
    vnet0 = {
      vnet_space              = ["10.0.0.0/16","172.16.0.0/16"]
    }

    vnet1 = {
      vnet_space              = ["172.17.0.0/16"]
    }
    vnet2 = {
      vnet_space              = ["172.17.0.0/16"]
    }
    vnet2 = {
      vnet_space              = ["172.17.0.0/16"]
    }
  }
}

output "vnets" {
  value = "${var.vnets}"
}