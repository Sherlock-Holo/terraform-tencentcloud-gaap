output "proxy_id" {
  value = module.proxy.proxy_id
}

output "layer4_listener_id" {
  value = module.layer4_listener.listener_id
}

output "layer7_listener_id" {
  value = module.layer7_listener.listener_id
}

output "http_domian_id" {
  value = module.layer7_listener.http_domian_id
}

output "http_rule_id" {
  value = module.layer7_listener.http_rule_id
}

output "layer7_listener_server_certificate_id" {
  value = module.layer7_listener.listener_server_certificate_id
}

output "layer7_listener_client_certificate_id" {
  value = module.layer7_listener.listener_client_certificate_id
}

output "http_domain_certificiate_id" {
  value = module.layer7_listener.http_domain_certificiate_id
}

output "http_domain_client_certificate_id" {
  value = module.layer7_listener.http_domain_client_certificate_id
}

output "http_domain_gaap_certificate_id" {
  value = module.layer7_listener.http_domain_gaap_certificate_id
}

output "http_domain_basic_auth_id" {
  value = module.layer7_listener.http_domain_basic_auth_id
}

output "http_domain_realserver_certificate_id" {
  value = module.layer7_listener.http_domain_realserver_certificate_id
}

output "realserver_ids" {
  value = module.realserver.realserver_ids
}

output "realserver_address" {
  value = module.realserver.realserver_address
}