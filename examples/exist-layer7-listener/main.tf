data "tencentcloud_gaap_proxies" "foo" {
  project_id = 0
}

data "tencentcloud_gaap_layer7_listeners" "HTTP" {
  protocol = "HTTP"
  proxy_id = data.tencentcloud_gaap_proxies.foo.proxies[0].id
}

data "tencentcloud_gaap_layer7_listeners" "HTTPS" {
  protocol = "HTTPS"
  proxy_id = data.tencentcloud_gaap_proxies.foo.proxies[0].id
}

module "HTTP_listener" {
  source = "../../"

  layer7_listener_id = data.tencentcloud_gaap_layer7_listeners.HTTP.listeners[0].id

  http_domain = "www.qq.com"

  http_rule_domain          = "www.qq.com"
  http_rule_path            = "/"
  http_rule_realserver_type = "IP"
  http_rule_scheduler       = "wrr"

  realserver_ips = [
    "1.1.1.1",
    "8.8.8.8"
  ]
  realserver_bind_port = [
    80,
    80
  ]
  realserver_bind_weight = [
    1,
    10
  ]

  domain_error_page_body           = "test error\r\n"
  domain_error_page_error_codes    = [404, 503]
  domain_error_page_clear_headers  = ["X-TEST", "X-ERROR"]
  domain_error_page_new_error_code = 403
  domain_error_page_set_headers = {
    "X-TT" : "TT",
    "X-ERR" : "ERR",
  }
}

module "HTTPS_listener" {
  source = "../../"

  layer7_listener_id = data.tencentcloud_gaap_layer7_listeners.HTTPS.listeners[0].id

  http_domain = "www.qq.com"

  http_rule_domain          = "www.qq.com"
  http_rule_path            = "/"
  http_rule_realserver_type = "DOMAIN"
  http_rule_scheduler       = "rr"

  realserver_domains = [
    "www.qq.com",
    "www.tencent.com"
  ]
  realserver_bind_port = [
    80,
    80
  ]
  realserver_bind_weight = [
    1,
    1
  ]

  domain_error_page_body           = "test error\r\n"
  domain_error_page_error_codes    = [404, 503]
  domain_error_page_clear_headers  = ["X-TEST", "X-ERROR"]
  domain_error_page_new_error_code = 403
  domain_error_page_set_headers = {
    "X-TT" : "TT",
    "X-ERR" : "ERR",
  }
}