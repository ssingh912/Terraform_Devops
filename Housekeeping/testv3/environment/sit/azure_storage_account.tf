variable "sas" {
  default = {
    sa0 = {
      sa_replication_type = "lrs"
    }
    sa1 = {
      sa_replication_type = "lrs"
    }
  }

}

output "sas" {
  value = "${var.sas}"
}
