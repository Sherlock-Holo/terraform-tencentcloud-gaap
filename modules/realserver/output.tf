output "realserver_ids" {
  description = "The list of realserver ID."
  value       = concat(tencentcloud_gaap_realserver.domain.*.id, tencentcloud_gaap_realserver.ip.*.id, var.realserver_ids)
}

output "realserver_address" {
  description = "The list of realserver address."
  value       = concat(tencentcloud_gaap_realserver.domain.*.domain, tencentcloud_gaap_realserver.ip.*.ip, var.realserver_ids)
}

output "realserver_bind_ports" {
  description = "The list of realserver bind port."
  value       = var.realserver_bind_ports
}

output "realserver_bind_weights" {
  description = "The list of realserver bind weight."
  value       = var.realserver_bind_weights
}