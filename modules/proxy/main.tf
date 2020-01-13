resource "tencentcloud_gaap_proxy" "default" {
  count = var.proxy_id == "" && var.proxy_access_region != "" ? 1 : 0

  access_region     = var.proxy_access_region
  bandwidth         = var.proxy_bandwidth
  concurrent        = var.proxy_concurrent
  name              = var.proxy_name
  realserver_region = var.proxy_realserver_region
  project_id        = var.proxy_project_id
  enable            = var.proxy_enable

  tags = var.tags
}

resource "tencentcloud_gaap_security_policy" "default" {
  count = var.proxy_security_policy_id == "" && var.proxy_security_policy_action != "" ? 1 : 0

  action   = var.proxy_security_policy_action
  proxy_id = var.proxy_id != "" ? var.proxy_id : tencentcloud_gaap_proxy.default[0].id
  enable   = var.proxy_security_policy_enable
}

resource "tencentcloud_gaap_security_rule" "default" {
  count = length(var.proxy_security_policy_rule_ports)

  action    = var.proxy_security_policy_rule_action[count.index]
  cidr_ip   = var.proxy_security_policy_rule_cidr_ips[count.index]
  policy_id = var.proxy_security_policy_id != "" ? var.proxy_security_policy_id : tencentcloud_gaap_security_policy.default[0].id
  name      = var.proxy_security_policy_rule_name
  port      = var.proxy_security_policy_rule_ports[count.index]
  protocol  = var.proxy_security_policy_rule_protocols[count.index]
}