resource "tencentcloud_gaap_certificate" "default_server_certificate" {
  count   = var.layer7_certificate_id == "" && var.layer7_certificate_content != "" ? 1 : 0
  name    = var.layer7_certificate_name
  content = var.layer7_certificate_content
  key     = var.layer7_certificate_key
  type    = "SERVER"
}

resource "tencentcloud_gaap_certificate" "default_client_certificate" {
  count   = length(var.layer7_client_certificate_contents) == 0 ? 0 : length(var.layer7_client_certificate_contents)
  name    = var.layer7_client_certificate_name
  content = var.layer7_client_certificate_contents[count.index]
  type    = "CLIENT"
}

resource "tencentcloud_gaap_layer7_listener" "default" {
  count                  = var.layer7_listener_id == "" && var.layer7_listener_protocol != "" ? 1 : 0
  proxy_id               = var.proxy_id
  name                   = var.layer7_listener_name
  port                   = var.layer7_listener_port
  protocol               = var.layer7_listener_protocol
  forward_protocol       = var.layer7_listener_forward_protocol
  auth_type              = var.layer7_listener_auth_type
  certificate_id         = var.layer7_certificate_id != "" ? var.layer7_certificate_id : tencentcloud_gaap_certificate.default_server_certificate[0].id
  client_certificate_ids = length(tencentcloud_gaap_certificate.default_client_certificate) > 0 ? tencentcloud_gaap_certificate.default_client_certificate.*.id : var.layer7_client_certificate_ids
}

resource "tencentcloud_gaap_certificate" "default_http_domain_certificate" {
  count   = var.http_domain_certificate_content == "" ? 0 : 1
  name    = var.http_domain_certificate_name
  content = var.http_domain_certificate_content
  key     = var.http_domain_certificate_key
  type    = "SERVER"
}

resource "tencentcloud_gaap_certificate" "default_http_domain_client_certificate" {
  count   = length(var.http_domain_client_certificate_contents) == 0 ? 0 : length(var.http_domain_client_certificate_contents)
  name    = var.layer7_client_certificate_name
  content = var.http_domain_client_certificate_contents[count.index]
  type    = "CLIENT"
}

resource "tencentcloud_gaap_certificate" "default_http_domain_basic_certificate" {
  count   = var.http_domain_basic_auth_content != "" ? 1 : 0
  name    = var.http_domain_basic_auth_name
  content = var.http_domain_basic_auth_content
  type    = "BASIC"
}

resource "tencentcloud_gaap_certificate" "default_http_domain_gaap_certificate" {
  count   = var.http_domain_gaap_certificate_content != "" ? 1 : 0
  name    = var.http_domain_gaap_certificate_name
  content = var.http_domain_gaap_certificate_content
  key     = var.http_domain_gaap_certificate_key
  type    = "PROXY"
}

resource "tencentcloud_gaap_certificate" "default_http_domain_realserver_certificate" {
  count   = length(var.http_domain_realserver_certificate_contents) == 0 ? 0 : length(var.http_domain_realserver_certificate_contents)
  name    = var.http_domain_realserver_certificate_name
  content = var.http_domain_realserver_certificate_contents[count.index]
  type    = "REALSERVER"
}

resource "tencentcloud_gaap_http_domain" "default" {
  count                         = var.http_domain_id == "" && var.http_domain != "" ? 1 : 0
  domain                        = var.http_domain
  listener_id                   = var.layer7_listener_id != "" ? var.layer7_listener_id : tencentcloud_gaap_layer7_listener.default[0].id
  basic_auth                    = var.http_domain_basic_auth
  basic_auth_id                 = length(tencentcloud_gaap_certificate.default_http_domain_basic_certificate) > 0 ? tencentcloud_gaap_certificate.default_http_domain_basic_certificate[0].id : var.http_domain_basic_auth_id
  certificate_id                = length(tencentcloud_gaap_certificate.default_http_domain_certificate) > 0 ? tencentcloud_gaap_certificate.default_http_domain_certificate[0].id : var.http_domain_certificate_id
  client_certificate_ids        = length(tencentcloud_gaap_certificate.default_http_domain_client_certificate) > 0 ? tencentcloud_gaap_certificate.default_http_domain_client_certificate.*.id : var.http_domain_client_certificate_ids
  gaap_auth                     = var.http_domain_gaap_auth
  gaap_auth_id                  = length(tencentcloud_gaap_certificate.default_http_domain_gaap_certificate) > 0 ? tencentcloud_gaap_certificate.default_http_domain_gaap_certificate[0].id : var.http_domain_gaap_certificate_id
  realserver_auth               = var.http_domain_realserver_auth
  realserver_certificate_domain = var.http_domain_realserver_certificate_domain
  realserver_certificate_ids    = length(tencentcloud_gaap_certificate.default_http_domain_realserver_certificate) > 0 ? tencentcloud_gaap_certificate.default_http_domain_realserver_certificate.*.id : var.http_domain_realserver_certificate_ids
}

resource "tencentcloud_gaap_http_rule" "default" {
  count = var.http_rule_id == "" && var.http_domain != "" && var.http_rule_path != "" ? 1 : 0

  domain                    = length(tencentcloud_gaap_http_domain.default) > 0 ? tencentcloud_gaap_http_domain.default[0].domain : var.http_domain
  health_check              = var.http_rule_health_check
  listener_id               = var.layer7_listener_id != "" ? var.layer7_listener_id : tencentcloud_gaap_layer7_listener.default[0].id
  path                      = var.http_rule_path
  realserver_type           = var.http_rule_realserver_type
  connect_timeout           = var.http_rule_connect_timeout
  health_check_method       = var.http_rule_health_check_method
  health_check_path         = var.http_rule_health_check_path
  health_check_status_codes = var.http_rule_health_check_status_codes
  interval                  = var.http_rule_health_check_interval
  scheduler                 = var.http_rule_scheduler

  dynamic "realservers" {
    for_each = var.http_rule_realserver_ids
    content {
      id     = realservers.value
      ip     = var.http_rule_realserver_address[index(var.http_rule_realserver_ids, realservers.value)]
      port   = var.http_rule_realserver_ports[index(var.http_rule_realserver_ids, realservers.value)]
      weight = var.http_rule_realserver_weights[index(var.http_rule_realserver_ids, realservers.value)]
    }
  }
}

resource "tencentcloud_gaap_domain_error_page" "default" {
  count = var.domain_error_page_body == "" ? 0 : 1

  body           = var.domain_error_page_body
  domain         = length(tencentcloud_gaap_http_domain.default) > 0 ? tencentcloud_gaap_http_domain.default[0].domain : var.http_domain
  error_codes    = var.domain_error_page_error_codes
  listener_id    = var.layer7_listener_id != "" ? var.layer7_listener_id : tencentcloud_gaap_layer7_listener.default[0].id
  clear_headers  = var.domain_error_page_clear_headers
  new_error_code = var.domain_error_page_new_error_code
  set_headers    = var.domain_error_page_set_headers
}