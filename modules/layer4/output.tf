output "listener_id" {
  description = "The list of GAAP layer4 listener ID."
  value       = var.layer4_listener_id != "" ? [var.layer4_listener_id] : tencentcloud_gaap_layer4_listener.default-layer4-listener.*.id
}
