variable "proxy_id" {
  description = "Specify the GAAP proxy id to launch resources."
  default     = ""
}

variable "layer7_listener_id" {
  description = "Specify the GAAP layer7 listener id to launch resources."
  default     = ""
}

variable "layer7_listener_name" {
  description = "The GAAP layer7 listener name used to launch a new layer7 listener when `layer7_listener_id` is not specified."
  default     = ""
}

variable "layer7_listener_port" {
  description = "The GAAP layer7 listener port used to launch a new layer7 listener when `layer7_listener_id` is not specified."
  type        = number
  default     = null
}

variable "layer7_listener_protocol" {
  description = "The GAAP layer7 listener protocol used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `HTTP` and `HTTPS`."
  default     = ""
}

variable "layer7_listener_auth_type" {
  description = "The GAAP layer7 listener auth type used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `0` and `1`."
  type        = number
  default     = null
}

variable "layer7_listener_forward_protocol" {
  description = "The GAAP layer7 listener forward protocol used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `HTTP` and `HTTPS`."
  type        = string
  default     = null
}

variable "http_domain_id" {
  description = "The GAAP HTTP domain id to launch resources."
  type        = string
  default     = ""
}

variable "http_domain" {
  description = "Specify GAAP HTTP domain to launch resources when `http_domain_id` is not specified."
  type        = string
  default     = ""
}

variable "http_domain_basic_auth" {
  description = "Specify if enable the GAAP HTTP domain basic auth or not when `http_domain_id` is not specified."
  default     = false
}

variable "http_domain_gaap_auth" {
  description = "Specify if enable the GAAP HTTP domain proxy auth or not when `http_domain_id` is not specified."
  default     = false
}

variable "http_domain_realserver_auth" {
  description = "Specify if enable the GAAP HTTP domain realserver auth or not when `http_domain_id` is not specified."
  default     = false
}

variable "http_rule_id" {
  description = "The GAAP HTTP rule id to launch resources."
  type        = string
  default     = ""
}

variable "http_rule_domain" {
  description = "Specify the GAAP HTTP rule domain when `http_rule_id` is not specified."
  type        = string
  default     = ""
}

variable "http_rule_listener" {
  description = "Specify the GAAP HTTP rule layer7 listener when `http_rule_id` is not specified."
  type        = string
  default     = ""
}

variable "http_rule_health_check" {
  description = "Specify if enable the GAAP HTTP rule health check or not when `http_rule_id` is not specified."
  default     = false
}

variable "http_rule_path" {
  description = "Specify the GAAP HTTP rule path when `http_rule_id` is not specified."
  type        = string
  default     = null
}

variable "http_rule_realserver_type" {
  description = "Specify the GAAP HTTP rule realserver type when `http_rule_id` is not specified, avaliable values: `IP` and `DOMAIN`."
  type        = string
  default     = null
}

variable "http_rule_connect_timeout" {
  description = "Specify the GAAP HTTP rule connect timeout when `http_rule_id` is not specified."
  type        = number
}

variable "http_rule_forward_host" {
  description = "Specify the GAAP HTTP rule forward host when `http_rule_id` is not specified."
  default     = "default"
}

variable "http_rule_health_check_method" {
  description = "Specify the GAAP HTTP rule health check method when `http_rule_id` is not specified, avaliable values: `GET` and `POST`."
  type        = string
  default     = null
}

variable "http_rule_health_check_path" {
  description = "Specify the GAAP HTTP rule health check path when `http_rule_id` is not specified."
  type        = string
  default     = null
}

variable "http_rule_health_check_status_codes" {
  description = "The list of GAAP HTTP rule health check status code when `http_rule_id` is not specified."
  type        = list(number)
  default     = null
}

variable "http_rule_health_check_interval" {
  description = "Specify the GAAP HTTP rule health check interval when `http_rule_id` is not specified."
  type        = number
}

variable "http_rule_scheduler" {
  description = "Specify the GAAP HTTP rule scheduler when `http_rule_id` is not specified, avaliable values: `rr`, `wrr` and `lc`."
  type        = string
  default     = "rr"
}

variable "http_rule_realserver_ids" {
  description = "The list of the GAAP realserver id when `http_rule_id` is not specified."
  type        = list(string)
  default     = []
}

variable "http_rule_realserver_address" {
  description = "The list of the GAAP realserver ip or domain when `http_rule_id` is not specified."
  type        = list(string)
  default     = []
}

variable "http_rule_realserver_ports" {
  description = "The list of the GAAP realserver port when `http_rule_id` is not specified."
  type        = list(number)
  default     = []
}

variable "http_rule_realserver_weights" {
  description = "The list of the GAAP realserver port when `http_rule_id` is not specified."
  type        = list(number)
  default     = []
}

variable "layer7_certificate_id" {
  description = "The GAAP layer7 listener certificate id use to launch resources."
  default     = ""
}

variable "layer7_certificate_name" {
  description = "The GAAP layer7 certificate name when `layer7_certificate_id` is not specified."
  default     = "tfmodule-l7-certificate"
}

variable "layer7_certificate_content" {
  description = "The GAAP layer7 certificate content when `layer7_certificate_id` is not specified."
  default     = ""
}

variable "layer7_certificate_key" {
  description = "The GAAP layer7 certificate key when `layer7_certificate_id` is not specified."
  default     = ""
}

variable "layer7_client_certificate_ids" {
  description = "The list of GAAP client certificate id use to launch resources."
  type        = list(string)
  default     = null
}

variable "layer7_client_certificate_name" {
  description = "The GAAP client certificate name when `layer7_client_certificate_ids` is not specified."
  default     = "tfmodule-l7-clientcertificate"
}

variable "layer7_client_certificate_contents" {
  description = "The list of GAAP client certificate content when `layer7_client_certificate_ids` is not specified."
  type        = list(string)
  default     = []
}

variable "http_domain_certificate_id" {
  description = "The GAAP HTTP domain certificate id use to launch resources."
  default     = "default"
}

variable "http_domain_certificate_name" {
  description = "The GAAP HTTP domain certificate name when `http_domain_certificate_id` is not specified."
  default     = "tfmodule-hd-certificate"
}

variable "http_domain_certificate_content" {
  description = "The GAAP HTTP domain certificate content when `http_domain_certificate_id` is not specified."
  default     = ""
}

variable "http_domain_certificate_key" {
  description = "The GAAP HTTP domain certificate key when `http_domain_certificate_id` is not specified."
  default     = ""
}

variable "http_domain_client_certificate_ids" {
  description = "The list of GAAP HTTP domain client certificate id use to launch resources."
  type        = list(string)
  default     = null
}

variable "http_domain_client_certificate_name" {
  description = "The GAAP HTTP domain certificate name when `http_domain_client_certificate_ids` is not specified."
  default     = "tfmodule-hd-clientcertificate"
}

variable "http_domain_client_certificate_contents" {
  description = "The list of GAAP HTTP domain client certificate content when `http_domain_client_certificate_ids` is not specified."
  type        = list(string)
  default     = []
}

variable "http_domain_basic_auth_id" {
  description = "The GAAP HTTP domain basic auth id use to launch resources."
  default     = ""
}

variable "http_domain_basic_auth_name" {
  description = "The GAAP HTTP domain basic auth name when `http_domain_basic_auth_id` is not specified."
  default     = "tfmodule-hd-basic-certificate"
}

variable "http_domain_basic_auth_content" {
  description = "The GAAP HTTP domain basic auth content when `http_domain_basic_auth_id` is not specified."
  default     = ""
}

variable "http_domain_gaap_certificate_id" {
  description = "The GAAP HTTP domain proxy certificate id use to launch resources."
  default     = ""
}

variable "http_domain_gaap_certificate_name" {
  description = "The GAAP HTTP domain proxy certificate name when `http_domain_gaap_certificate_id` is not specified."
  default     = "tfmodule-hd-proxy-certificate"
}

variable "http_domain_gaap_certificate_content" {
  description = "The GAAP HTTP domain proxy certificate content when `http_domain_gaap_certificate_id` is not specified."
  default     = ""
}

variable "http_domain_gaap_certificate_key" {
  description = "The GAAP HTTP domain proxy certificate key when `http_domain_gaap_certificate_id` is not specified."
  default     = ""
}

variable "http_domain_realserver_certificate_ids" {
  description = "The list of GAAP HTTP domain realserver certificate id use to launch resources."
  type        = list(string)
  default     = null
}

variable "http_domain_realserver_certificate_name" {
  description = "The GAAP HTTP domain realserver certificate name when `http_domain_realserver_certificate_ids` is not specified."
  default     = "tfmodule-hd-rs-certificate"
}

variable "http_domain_realserver_certificate_contents" {
  description = "The list of GAAP HTTP domain client certificate content when `http_domain_realserver_certificate_ids` is not specified."
  type        = list(string)
  default     = []
}

variable "http_domain_realserver_certificate_domain" {
  description = "The GAAP HTTP domain realserver certificate domain when `http_domain_realserver_certificate_ids` is not specified."
  default     = ""
}
