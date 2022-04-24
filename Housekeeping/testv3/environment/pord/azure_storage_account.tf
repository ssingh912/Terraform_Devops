variable "sas" {
  default = {
    sa0 = {
      sa_replication_type = "lrs"
      enable_hierachical_namespace = "false"
    }
    sa1 = {
      sa_replication_type = "lrs"
      enable_hierachical_namespace = "false"
    }
  }

}

output "sas" {
  value = "${var.sas}"
}
