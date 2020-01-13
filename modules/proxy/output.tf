output "proxy_id" {
  description = "The list of GAAP proxy ID."
  value       = length(tencentcloud_gaap_proxy.default) > 0 ? tencentcloud_gaap_proxy.default.*.id : [var.proxy_id]
}

output "policy_id" {
  description = "The list of GAAP proxy policy ID."
  value       = length(tencentcloud_gaap_security_policy.default) > 0 ? tencentcloud_gaap_security_policy.default.*.id : [var.proxy_security_policy_id]
}

output "policy_rule_id" {
  description = "The list of GAAP proxy policy rule ID."
  value       = tencentcloud_gaap_security_rule.default.*.id
}