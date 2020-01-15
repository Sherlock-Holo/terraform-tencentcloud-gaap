output "proxy_id" {
  description = "GAAP proxy ID."
  value = module.layer4_listener.proxy_id
}

output "layer4_listener_id" {
  description = "GAAP layer4 listener ID."
  value = module.layer4_listener.layer4_listener_id
}

output "layer7_listener_id" {
  description = "GAAP layer7 listener ID."
  value = module.layer7_listener.layer7_listener_id
}

output "realserver_ids" {
  description = "A list of GAAP realserver ID."
  value = module.layer4_listener.realserver_ids
}