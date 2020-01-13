module "layer4_listener" {
  source = "../../"

  proxy_name              = "simple-proxy"
  proxy_access_region     = "EastChina"
  proxy_realserver_region = "SouthChina"
  proxy_concurrent        = 2
  proxy_bandwidth         = 10

  proxy_tags = {
    "test" : "test"
  }

  proxy_security_policy_action = "ACCEPT"

  proxy_security_policy_rule_name      = "simple rule"
  proxy_security_policy_rule_action    = ["ACCEPT", "DROP"]
  proxy_security_policy_rule_cidr_ips  = ["1.1.1.1", "2.2.2.2"]
  proxy_security_policy_rule_ports     = ["80", "80,90"]
  proxy_security_policy_rule_protocols = ["TCP", "UDP"]


  layer4_listener_name            = "simple-TCP-listener"
  layer4_listener_protocol        = "TCP"
  layer4_listener_port            = 80
  layer4_listener_realserver_type = "IP"

  layer4_listener_scheduler = "wrr"

  realserver_tags = {
    "test" : "test"
  }

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
}

module "layer7_listener" {
  source = "../../"

  proxy_name              = "simple-proxy"
  proxy_access_region     = "EastChina"
  proxy_realserver_region = "SouthChina"
  proxy_concurrent        = 2
  proxy_bandwidth         = 10

  proxy_tags = {
    "test" : "test"
  }

  layer7_listener_name             = "simple-HTTPS-listener"
  layer7_listener_protocol         = "HTTPS"
  layer7_listener_forward_protocol = "HTTPS"
  layer7_listener_auth_type        = 0
  layer7_listener_port             = 443

  layer7_certificate_content = file("public1.pem")
  layer7_certificate_key     = file("pkey.pem")

  http_domain = "www.qq.com"
  http_domain_client_certificate_contents = [
    file("public1.pem"),
    file("public2.pem")
  ]

  http_rule_domain          = "www.qq.com"
  http_rule_path            = "/"
  http_rule_realserver_type = "IP"

  realserver_ids = module.layer4_listener.realserver_ids
  realserver_ips = module.layer4_listener.realserver_address
  realserver_bind_port = [
    80,
    80
  ]
  realserver_bind_weight = [
    1,
    1
  ]
}