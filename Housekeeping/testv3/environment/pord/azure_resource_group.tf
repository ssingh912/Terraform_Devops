variable "rgs" {
  default = {
    rg0 = {}
    rg1 = {}
    rg2 = {}

  }
}

output "rgs" {
  value = "${var.rgs}"
}
