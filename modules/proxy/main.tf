resource "tencentcloud_gaap_proxy" "default" {
  count = var.proxy_id == "" ? 1 : 0

  access_region     = var.access_region
  bandwidth         = var.bandwidth
  concurrent        = var.concurrent
  name              = var.name
  realserver_region = var.realserver_region
  project_id        = var.project_id

  tags = var.tags
}

resource "tencentcloud_gaap_security_policy" "default" {
  count = var.policy_id == "" ? 1 : 0

  action   = var.policy_action
  proxy_id = var.proxy_id != "" ? var.proxy_id : tencentcloud_gaap_proxy.default[0].id
}

resource "tencentcloud_gaap_security_rule" "default" {
  count = length(var.policy_rules)

  action    = lookup(var.policy_rules[count.index], "action", null)
  cidr_ip   = lookup(var.policy_rules[count.index], "cidr_ip", null)
  policy_id = var.policy_id != "" ? var.policy_id : tencentcloud_gaap_security_policy.default[0].id
  name      = var.policy_rule_name
  port      = lookup(var.policy_rules[count.index], "port", "ALL")
  protocol  = lookup(var.policy_rules[count.index], "protocol", "ALL")
}