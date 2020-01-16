output "proxy_id" {
  description = "The GAAP proxy ID."
  value       = var.proxy_id != "" ? var.proxy_id : tencentcloud_gaap_proxy.default[0].id
}

output "listener_id" {
  description = "The GAAP layer4 listener ID."
  value       = tencentcloud_gaap_layer4_listener.default.id
}

output "realserver_ids" {
  description = "The list of GAAP realserver ID."
  value       = compact(concat(tencentcloud_gaap_realserver.default.*.id, [for res in var.realservers : lookup(res, "id", null)]))
}