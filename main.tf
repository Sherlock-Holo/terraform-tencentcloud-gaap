//provider "tencentcloud" {
//  version = ">=1.28"
//  region  = "ap-guangzhou"
//}
//
//module "proxy" {
//  source = "./modules/proxy"
//
//  proxy_id                = var.proxy_id
//  proxy_name              = var.proxy_name
//  proxy_project_id        = var.proxy_project_id
//  proxy_bandwidth         = var.proxy_bandwidth
//  proxy_concurrent        = var.proxy_concurrent
//  proxy_access_region     = var.proxy_access_region
//  proxy_realserver_region = var.proxy_realserver_region
//  proxy_enable            = var.proxy_enable
//
//  proxy_security_policy_id     = var.proxy_security_policy_id
//  proxy_security_policy_enable = var.proxy_security_policy_enable
//  proxy_security_policy_action = var.proxy_security_policy_action
//
//  proxy_security_policy_rule_name      = var.proxy_security_policy_rule_name
//  proxy_security_policy_rule_action    = var.proxy_security_policy_rule_action
//  proxy_security_policy_rule_ports     = var.proxy_security_policy_rule_ports
//  proxy_security_policy_rule_cidr_ips  = var.proxy_security_policy_rule_cidr_ips
//  proxy_security_policy_rule_protocols = var.proxy_security_policy_rule_protocols
//
//  tags = merge(var.proxy_tags, var.tags)
//}
//
//module "realserver" {
//  source = "./modules/realserver"
//
//  realserver_ids          = var.realserver_ids
//  realserver_name         = var.realserver_name
//  realserver_domains      = var.realserver_domains
//  realserver_ips          = var.realserver_ips
//  realserver_project_id   = var.realserver_project_id
//  realserver_bind_ports   = var.realserver_bind_port
//  realserver_bind_weights = var.realserver_bind_weight
//
//  tags = merge(var.realserver_tags, var.tags)
//}
//
//module "layer4_listener" {
//  source = "./modules/layer4"
//
//  proxy_id              = module.proxy.proxy_id[0]
//  listener_id           = var.layer4_listener_id
//  name                  = var.layer4_listener_name
//  port                  = var.layer4_listener_port
//  protocol              = var.layer4_listener_protocol
//  realserver_type       = var.layer4_listener_realserver_type
//  health_check          = var.layer4_listener_health_check
//  health_check_interval = var.layer4_listener_health_check_interval
//  connect_timeout       = var.layer4_listener_connect_timeout
//  scheduler             = var.layer4_listener_scheduler
//
//  realserver_ids     = module.realserver.realserver_ids
//  realserver_address = concat(var.realserver_ips, var.realserver_domains)
//  realserver_ports   = module.realserver.realserver_bind_ports
//  realserver_weights = module.realserver.realserver_bind_weights
//}
//
//module "layer7_listener" {
//  source = "./modules/layer7"
//
//  proxy_id                         = module.proxy.proxy_id[0]
//  layer7_listener_id               = var.layer7_listener_id
//  layer7_listener_name             = var.layer7_listener_name
//  layer7_listener_port             = var.layer7_listener_port
//  layer7_listener_protocol         = var.layer7_listener_protocol
//  layer7_listener_auth_type        = var.layer7_listener_auth_type
//  layer7_listener_forward_protocol = var.layer7_listener_forward_protocol
//
//  layer7_certificate_id      = var.layer7_certificate_id
//  layer7_certificate_name    = var.layer7_certificate_name
//  layer7_certificate_key     = var.layer7_certificate_key
//  layer7_certificate_content = var.layer7_certificate_content
//
//  layer7_client_certificate_ids      = var.layer7_client_certificate_ids
//  layer7_client_certificate_name     = var.layer7_client_certificate_name
//  layer7_client_certificate_contents = var.layer7_client_certificate_contents
//
//  http_domain_id = var.http_domain_id
//  http_domain    = var.http_domain
//
//  http_domain_basic_auth         = var.http_domain_basic_auth
//  http_domain_basic_auth_id      = var.http_domain_basic_auth_id
//  http_domain_basic_auth_content = var.http_domain_basic_auth_content
//  http_domain_basic_auth_name    = var.http_domain_basic_auth_name
//
//  http_domain_certificate_id      = var.http_domain_certificate_id
//  http_domain_certificate_name    = var.http_domain_certificate_name
//  http_domain_certificate_content = var.http_domain_certificate_content
//  http_domain_certificate_key     = var.http_domain_certificate_key
//
//  http_domain_client_certificate_ids      = var.http_domain_client_certificate_ids
//  http_domain_client_certificate_name     = var.http_domain_client_certificate_name
//  http_domain_client_certificate_contents = var.http_domain_client_certificate_contents
//
//  http_domain_gaap_auth                = var.http_domain_gaap_auth
//  http_domain_gaap_certificate_id      = var.http_domain_gaap_certificate_id
//  http_domain_gaap_certificate_name    = var.http_domain_gaap_certificate_name
//  http_domain_gaap_certificate_content = var.http_domain_gaap_certificate_content
//  http_domain_gaap_certificate_key     = var.http_domain_gaap_certificate_key
//
//  http_domain_realserver_auth                 = var.http_domain_realserver_auth
//  http_domain_realserver_certificate_ids      = var.http_domain_realserver_certificate_ids
//  http_domain_realserver_certificate_name     = var.http_domain_realserver_certificate_name
//  http_domain_realserver_certificate_domain   = var.http_domain_realserver_certificate_domain
//  http_domain_realserver_certificate_contents = var.http_domain_realserver_certificate_contents
//
//  http_rule_id     = var.http_rule_id
//  http_rule_domain = var.http_rule_domain
//
//  http_rule_connect_timeout           = var.http_rule_connect_timeout
//  http_rule_forward_host              = var.http_rule_forward_host
//  http_rule_health_check              = var.http_rule_health_check
//  http_rule_health_check_interval     = var.http_rule_health_check_interval
//  http_rule_health_check_method       = var.http_rule_health_check_method
//  http_rule_health_check_path         = var.http_rule_health_check_path
//  http_rule_health_check_status_codes = var.http_rule_health_check_status_codes
//
//  http_rule_listener = var.http_rule_listener
//  http_rule_path     = var.http_rule_path
//
//  http_rule_realserver_ids     = module.realserver.realserver_ids
//  http_rule_realserver_address = concat(var.realserver_ips, var.realserver_domains)
//  http_rule_realserver_ports   = module.realserver.realserver_bind_ports
//  http_rule_realserver_weights = module.realserver.realserver_bind_weights
//  http_rule_realserver_type    = var.http_rule_realserver_type
//
//  http_rule_scheduler = var.http_rule_scheduler
//
//  domain_error_page_body           = var.domain_error_page_body
//  domain_error_page_error_codes    = var.domain_error_page_error_codes
//  domain_error_page_clear_headers  = var.domain_error_page_clear_headers
//  domain_error_page_new_error_code = var.domain_error_page_new_error_code
//  domain_error_page_set_headers    = var.domain_error_page_set_headers
//}