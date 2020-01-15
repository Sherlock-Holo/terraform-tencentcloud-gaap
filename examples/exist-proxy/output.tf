output "proxy_id" {
  description = "The list of GAAP proxy ID."
  value       = module.layer4_listener.proxy_id
}

output "layer4_listener_id" {
  description = "The list of GAAP layer4 listener ID."
  value       = module.layer4_listener.layer4_listener_id
}

output "layer7_listener_id" {
  description = "The list of GAAP layer7 listener ID."
  value       = module.layer7_listener.layer7_listener_id
}

output "realserver_ids" {
  description = "The list of GAAP realserver ID."
  value       = module.layer4_listener.realserver_ids
}

output "domain_error_page_id" {
  description = "The list of GAAP domain error page ID."
  value       = module.layer7_listener.domain_error_page_id
}