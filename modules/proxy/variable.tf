variable "tags" {
  description = "A map of tags to add to GAAP porxy."
  type        = map(string)
  default     = {}
}

variable "proxy_id" {
  description = "The GAAP proxy ID use to launch resources."
  default = ""
}

variable "proxy_name" {
  description = "The proxy name used to launch a new proxy when `proxy_id` is not specified."
  default     = "tf-modules-proxy"
}

variable "proxy_access_region" {
  description = "The proxy access region used to launch a new proxy when `proxy_id` is not specified."
  default     = ""
}

variable "proxy_realserver_region" {
  description = "The proxy realserver region used to launch a new proxy when `proxy_id` is not specified."
  default     = ""
}

variable "proxy_bandwidth" {
  description = "The proxy bandwidth used to launch a new proxy when `proxy_id` is not specified."
  type        = number
  default     = null
}

variable "proxy_concurrent" {
  description = "The proxy concurrent used to launch a new proxy when `proxy_id` is not specified."
  type        = number
  default     = null
}

variable "proxy_project_id" {
  description = "The proxy project ID used to launch a new proxy when `proxy_id` is not specified."
  type = number
  default     = 0
}

variable "proxy_enable" {
  description = "Enable the proxy or not."
  default     = true
}

variable "proxy_security_policy_id" {
  description = "The GAAP proxy security policy ID use to launch resources."
  default = ""
}

variable "proxy_security_policy_enable" {
  description = "Specify enable the GAAP proxy security policy or not."
  default     = true
}

variable "proxy_security_policy_action" {
  description = "Specify action of the GAAP proxy security policy to launch resources, available values: `ACCEPT` and `DROP`."
  default     = ""
}

variable "proxy_security_policy_rule_name" {
  description = "Specify the GAAP proxy security policy rule name to launch resources."
  default     = "tf-modules-policy-rule"
}

variable "proxy_security_policy_rule_ports" {
  description = "List of the GAAP proxy security policy rule port."
  type        = list(string)
  default     = []
}

variable "proxy_security_policy_rule_protocols" {
  description = "List of the GAAP proxy security policy rule protocol, available values: `TCP`, `UDP` and `ALL`."
  type        = list(string)
  default     = []
}

variable "proxy_security_policy_rule_action" {
  description = "List of the GAAP proxy security policy rule action, available values: `ACCEPT` and `DROP`."
  type        = list(string)
  default     = []
}

variable "proxy_security_policy_rule_cidr_ips" {
  description = "List of the GAAP proxy security policy rule cidr IP."
  type        = list(string)
  default     = []
}