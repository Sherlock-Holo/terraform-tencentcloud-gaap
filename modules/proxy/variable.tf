variable "tags" {
  description = "A map of tags to add to GAAP proxy."
  type        = map(string)
  default     = {}
}

variable "proxy_id" {
  description = "The GAAP proxy ID use to launch resources."
  default     = ""
}

variable "name" {
  description = "The proxy name used to launch a new proxy when `proxy_id` is not specified."
  default     = "tf-modules-proxy"
}

variable "access_region" {
  description = "The proxy access region used to launch a new proxy when `proxy_id` is not specified."
  default     = ""
}

variable "realserver_region" {
  description = "The proxy realserver region used to launch a new proxy when `proxy_id` is not specified."
  default     = ""
}

variable "bandwidth" {
  description = "The proxy bandwidth used to launch a new proxy when `proxy_id` is not specified."
  type        = number
  default     = null
}

variable "concurrent" {
  description = "The proxy concurrent used to launch a new proxy when `proxy_id` is not specified."
  type        = number
  default     = null
}

variable "project_id" {
  description = "The proxy project ID used to launch a new proxy when `proxy_id` is not specified."
  type        = number
  default     = 0
}

variable "policy_id" {
  description = "The GAAP proxy security policy ID use to launch resources."
  default     = ""
}

variable "policy_action" {
  description = "Specify action of the GAAP proxy security policy to launch resources when `policy_id` is not specified, available values: `ACCEPT` and `DROP`."
  default     = ""
}

variable "policy_rule_name" {
  description = "Specify the GAAP proxy security policy rule name to launch resources."
  default     = "tf-modules-policy-rule"
}

variable "policy_rules" {
  description = "Specify the GAAP proxy security policy rule config, each map contains `action`, `cidr_ip`, `port` and `protocl`. If `port` omitted, will use default value `ALL`; if `protocol` is omitted, will use default value `ALL`."
  type        = list(map(string))
  default     = []
}