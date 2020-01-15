output "http_listener_id" {
  description = "The list of GAAP HTTP listener ID."
  value       = module.HTTP_listener.layer7_listener_id
}

output "http_rule_id" {
  description = "The list of GAAP HTTP rule ID."
  value       = module.HTTP_listener.http_rule_id
}

output "https_listener_id" {
  description = "The list of GAAP HTTPS listener ID."
  value       = module.HTTPS_listener.layer7_listener_id
}

output "https_rule_id" {
  description = "The list of GAAP HTTPS rule ID."
  value       = module.HTTPS_listener.http_rule_id
}

output "http_domain_error_page_id" {
  description = "The list of GAAP HTTP domain error page ID."
  value       = module.HTTP_listener.domain_error_page_id
}

output "https_domain_error_page_id" {
  description = "The list of GAAP HTTPS domain error page ID."
  value       = module.HTTPS_listener.domain_error_page_id
}