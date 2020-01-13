output "realserver_ids" {
  value = concat(tencentcloud_gaap_realserver.domain.*.id, tencentcloud_gaap_realserver.ip.*.id, var.realserver_ids)
}

output "realserver_address" {
  value = concat(tencentcloud_gaap_realserver.domain.*.domain, tencentcloud_gaap_realserver.ip.*.ip, var.realserver_ids)
}

output "realserver_bind_ports" {
  value = var.realserver_bind_ports
}

output "realserver_bind_weights" {
  value = var.realserver_bind_weights
}