output "http_listener_id" {
  description = "GAAP HTTP listener ID."
  value = module.HTTP_listener.layer7_listener_id
}

output "http_rule_id" {
  description = "The list of GAAP HTTP rule ID."
  value = module.HTTP_listener.http_rule_id
}

output "https_listener_id" {
  description = "GAAP HTTPS listener ID."
  value = module.HTTPS_listener.layer7_listener_id
}

output "https_rule_id" {
  description = "The list of GAAP HTTPS rule ID."
  value = module.HTTPS_listener.http_rule_id
}