variable "akvs" {
  default = {
    akv0 = {}
    akv1 = {}
    akv2 = {}
  }

}


output "akvs" {
  value = "${var.akvs}"
}
