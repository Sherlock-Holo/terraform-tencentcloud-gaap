//variable "tags" {
//  description = "Global tags to add to all resources."
//  type        = map(string)
//  default     = {}
//}
//
//variable "proxy_tags" {
//  description = "The tags of GAAP proxy."
//  type        = map(string)
//  default     = {}
//}
//
//variable "proxy_id" {
//  description = "The GAAP proxy ID use to launch resources."
//  default     = ""
//}
//
//variable "proxy_name" {
//  description = "The proxy name used to launch a new proxy when `proxy_id` is not specified."
//  default     = "tf-modules-proxy"
//}
//
//variable "proxy_access_region" {
//  description = "The proxy access region used to launch a new proxy when `proxy_id` is not specified."
//  default     = ""
//}
//
//variable "proxy_realserver_region" {
//  description = "The proxy realserver region used to launch a new proxy when `proxy_id` is not specified."
//  default     = ""
//}
//
//variable "proxy_bandwidth" {
//  description = "The proxy bandwidth used to launch a new proxy when `proxy_id` is not specified."
//  type        = number
//  default     = null
//}
//
//variable "proxy_concurrent" {
//  description = "The proxy concurrent used to launch a new proxy when `proxy_id` is not specified."
//  type        = number
//  default     = null
//}
//
//variable "proxy_project_id" {
//  description = "The proxy project ID used to launch a new proxy when `proxy_id` is not specified."
//  type        = number
//  default     = 0
//}
//
//variable "proxy_enable" {
//  description = "Enable the proxy or not when `proxy_id` is not specified."
//  default     = true
//}
//
//variable "proxy_security_policy_id" {
//  description = "The GAAP proxy security policy ID use to launch resources."
//  default     = ""
//}
//
//variable "proxy_security_policy_enable" {
//  description = "Specify enable the GAAP proxy security policy or not when `proxy_security_policy_id` is not specified."
//  default     = true
//}
//
//variable "proxy_security_policy_action" {
//  description = "Specify action of the GAAP proxy security policy to launch resources when `proxy_security_policy_id` is not specified, available values: `ACCEPT` and `DROP`."
//  default     = ""
//}
//
//variable "proxy_security_policy_rule_name" {
//  description = "Specify the GAAP proxy security policy rule name to launch resources."
//  default     = "tf-modules-policy-rule"
//}
//
//variable "proxy_security_policy_rule_ports" {
//  description = "List of the GAAP proxy security policy rule port."
//  type        = list(string)
//  default     = []
//}
//
//variable "proxy_security_policy_rule_protocols" {
//  description = "List of the GAAP proxy security policy rule protocol."
//  type        = list(string)
//  default     = []
//}
//
//variable "proxy_security_policy_rule_action" {
//  description = "List of the GAAP proxy security policy rule action, available values: `ACCEPT` and `DROP`."
//  type        = list(string)
//  default     = []
//}
//
//variable "proxy_security_policy_rule_cidr_ips" {
//  description = "List of the GAAP proxy security policy rule cidr IP."
//  type        = list(string)
//  default     = []
//}
//
//variable "layer4_listener_id" {
//  description = "Specify the GAAP layer4 listener ID to launch resources."
//  default     = ""
//}
//
//variable "layer4_listener_protocol" {
//  description = "The GAAP layer4 listener protocol used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `TCP` and `UDP`."
//  default     = ""
//}
//
//variable "layer4_listener_name" {
//  description = "The GAAP layer4 listener name used to launch a new layer4 listener when `layer4_listener_id` is not specified."
//  default     = ""
//}
//
//variable "layer4_listener_port" {
//  description = "The GAAP layer4 listener port used to launch a new layer4 listener when `layer4_listener_id` is not specified."
//  type        = number
//  default     = null
//}
//
//variable "layer4_listener_type" {
//  description = "The GAAP layer4 listener type used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `TCP` and `UDP`."
//  type        = string
//  default     = null
//}
//
//variable "layer4_listener_realserver_type" {
//  description = "The GAAP layer4 listener realserver type used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `IP` and `DOMAIN`."
//  type        = string
//  default     = null
//}
//
//variable "layer4_listener_connect_timeout" {
//  description = "The GAAP layer4 listener connect timeout used to launch a new layer4 listener when `layer4_listener_id` is not specified."
//  default     = 2
//}
//
//variable "layer4_listener_health_check" {
//  description = "Enable the GAAP layer4 listener health check or not used to launch a new layer4 listener when `layer4_listener_id` is not specified."
//  default     = false
//}
//
//variable "layer4_listener_health_check_interval" {
//  description = "The GAAP layer4 listener health check interval used to launch a new layer4 listener when `layer4_listener_id` is not specified."
//  default     = 5
//}
//
//variable "layer4_listener_scheduler" {
//  description = "The GAAP layer4 listener scheduler used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `rr`, `wrr` and `lc`."
//  type        = string
//  default     = null
//}
//
//variable "layer4_listenere_realservers" {
//  description = "The list of the GAAP layer4 listener realserver config when `layer4_listener_id` is not specified, each config must contian key `id`, `ip`, `port` and `weight`."
//  type        = list(map(string))
//  default     = []
//}
//
//variable "layer7_listener_id" {
//  description = "Specify the GAAP layer4 listener ID to launch resources."
//  default     = ""
//}
//
//variable "layer7_listener_name" {
//  description = "The GAAP layer7 listener name used to launch a new layer7 listener when `layer7_listener_id` is not specified."
//  default     = ""
//}
//
//variable "layer7_listener_port" {
//  description = "The GAAP layer7 listener port used to launch a new layer7 listener when `layer7_listener_id` is not specified."
//  type        = number
//  default     = null
//}
//
//variable "layer7_listener_protocol" {
//  description = "The GAAP layer4 listener protocol used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `HTTP` and `HTTPS`."
//  default     = ""
//}
//
//variable "layer7_listener_auth_type" {
//  description = "The GAAP layer7 listener auth type used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `0` and `1`."
//  type        = number
//  default     = null
//}
//
//variable "layer7_listener_forward_protocol" {
//  description = "The GAAP layer7 listener forward protocol used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `HTTP` and `HTTPS`."
//  type        = string
//  default     = null
//}
//
//variable "http_domain_id" {
//  description = "The GAAP HTTP domain ID to launch resources."
//  type        = string
//  default     = ""
//}
//
//variable "http_domain" {
//  description = "Specify GAAP HTTP domain to launch resources when `http_domain_id` is not specified."
//  type        = string
//  default     = ""
//}
//
//variable "http_domain_basic_auth" {
//  description = "Specify if enable the GAAP HTTP domain basic auth or not when `http_domain_id` is not specified."
//  default     = false
//}
//
//variable "http_domain_gaap_auth" {
//  description = "Specify if enable the GAAP HTTP domain proxy auth or not when `http_domain_id` is not specified."
//  default     = false
//}
//
//variable "http_domain_realserver_auth" {
//  description = "Specify if enable the GAAP HTTP domain realserver auth or not when `http_domain_id` is not specified."
//  default     = false
//}
//
//variable "http_rule_id" {
//  description = "The GAAP HTTP rule ID to launch resources."
//  type        = string
//  default     = ""
//}
//
//variable "http_rule_domain" {
//  description = "Specify the GAAP HTTP rule domain when `http_rule_id` is not specified."
//  type        = string
//  default     = ""
//}
//
//variable "http_rule_listener" {
//  description = "Specify the GAAP HTTP rule layer7 listener when `http_rule_id` is not specified."
//  type        = string
//  default     = ""
//}
//
//variable "http_rule_health_check" {
//  description = "Specify if enable the GAAP HTTP rule health check or not when `http_rule_id` is not specified."
//  default     = false
//}
//
//variable "http_rule_path" {
//  description = "Specify the GAAP HTTP rule path when `http_rule_id` is not specified."
//  type        = string
//  default     = null
//}
//
//variable "http_rule_realserver_type" {
//  description = "Specify the GAAP HTTP rule realserver type when `http_rule_id` is not specified, available values: `IP` and `DOMAIN`."
//  type        = string
//  default     = null
//}
//
//variable "http_rule_connect_timeout" {
//  description = "Specify the GAAP HTTP rule connect timeout when `http_rule_id` is not specified."
//  default     = 2
//}
//
//variable "http_rule_forward_host" {
//  description = "Specify the GAAP HTTP rule forward host when `http_rule_id` is not specified."
//  default     = "default"
//}
//
//variable "http_rule_health_check_method" {
//  description = "Specify the GAAP HTTP rule health check method when `http_rule_id` is not specified, available values: `GET` and `POST`."
//  type        = string
//  default     = null
//}
//
//variable "http_rule_health_check_path" {
//  description = "Specify the GAAP HTTP rule health check path when `http_rule_id` is not specified."
//  type        = string
//  default     = null
//}
//
//variable "http_rule_health_check_status_codes" {
//  description = "The list of GAAP HTTP rule health check status code when `http_rule_id` is not specified."
//  type        = list(number)
//  default     = null
//}
//
//variable "http_rule_health_check_interval" {
//  description = "Specify the GAAP HTTP rule health check interval when `http_rule_id` is not specified."
//  default     = 5
//}
//
//variable "http_rule_scheduler" {
//  description = "Specify the GAAP HTTP rule scheduler when `http_rule_id` is not specified, available values: `rr`, `wrr` and `lc`."
//  type        = string
//  default     = null
//}
//
//variable "http_rule_realservers" {
//  description = "The list of the GAAP HTTP rule realserver config when `http_rule_id` is not specified, each config must contian key `id`, `ip`, `port` and `weight`."
//  type        = list(map(string))
//  default     = null
//}
//
//variable "layer7_certificate_id" {
//  description = "The GAAP layer7 listener certificate ID use to launch resources."
//  default     = ""
//}
//
//variable "layer7_certificate_name" {
//  description = "The GAAP layer7 certificate name when `layer7_certificate_id` is not specified."
//  default     = "tf-module-layer7-certificate"
//}
//
//variable "layer7_certificate_content" {
//  description = "The GAAP layer7 certificate content when `layer7_certificate_id` is not specified."
//  default     = ""
//}
//
//variable "layer7_certificate_key" {
//  description = "The GAAP layer7 certificate key when `layer7_certificate_id` is not specified."
//  default     = ""
//}
//
//variable "layer7_client_certificate_ids" {
//  description = "The list of GAAP client certificate ID use to launch resources."
//  type        = list(string)
//  default     = null
//}
//
//variable "layer7_client_certificate_name" {
//  description = "The GAAP client certificate name when `layer7_client_certificate_ids` is not specified."
//  default     = "tfmodule-l7-clientcertificate"
//}
//
//variable "layer7_client_certificate_contents" {
//  description = "The list of GAAP client certificate content when `layer7_client_certificate_ids` is not specified."
//  type        = list(string)
//  default     = []
//}
//
//variable "http_domain_certificate_id" {
//  description = "The GAAP HTTP domain certificate ID use to launch resources."
//  default     = "default"
//}
//
//variable "http_domain_certificate_name" {
//  description = "The GAAP HTTP domain certificate name when `http_domain_certificate_id` is not specified."
//  default     = "tf-module-hd-certificate"
//}
//
//variable "http_domain_certificate_content" {
//  description = "The GAAP HTTP domain certificate content when `http_domain_certificate_id` is not specified."
//  default     = ""
//}
//
//variable "http_domain_certificate_key" {
//  description = "The GAAP HTTP domain certificate key when `http_domain_certificate_id` is not specified."
//  default     = ""
//}
//
//variable "http_domain_client_certificate_ids" {
//  description = "The list of GAAP HTTP domain client certificate ID use to launch resources."
//  type        = list(string)
//  default     = null
//}
//
//variable "http_domain_client_certificate_name" {
//  description = "The GAAP HTTP domain certificate name when `http_domain_client_certificate_ids` is not specified."
//  default     = "tfmodule-hd-clientcertificate"
//}
//
//variable "http_domain_client_certificate_contents" {
//  description = "The list of GAAP HTTP domain client certificate content when `http_domain_client_certificate_ids` is not specified."
//  type        = list(string)
//  default     = []
//}
//
//variable "http_domain_basic_auth_id" {
//  description = "The GAAP HTTP domain basic auth ID use to launch resources."
//  default     = ""
//}
//
//variable "http_domain_basic_auth_name" {
//  description = "The GAAP HTTP domain basic auth name when `http_domain_basic_auth_id` is not specified."
//  default     = "tfmodule-hd-basic-certificate"
//}
//
//variable "http_domain_basic_auth_content" {
//  description = "The GAAP HTTP domain basic auth content when `http_domain_basic_auth_id` is not specified."
//  default     = ""
//}
//
//variable "http_domain_gaap_certificate_id" {
//  description = "The GAAP HTTP domain proxy certificate ID use to launch resources."
//  default     = ""
//}
//
//variable "http_domain_gaap_certificate_name" {
//  description = "The GAAP HTTP domain proxy certificate name when `http_domain_gaap_certificate_id` is not specified."
//  default     = "tfmodule-hd-proxy-certificate"
//}
//
//variable "http_domain_gaap_certificate_content" {
//  description = "The GAAP HTTP domain proxy certificate content when `http_domain_gaap_certificate_id` is not specified."
//  default     = ""
//}
//
//variable "http_domain_gaap_certificate_key" {
//  description = "The GAAP HTTP domain proxy certificate key when `http_domain_gaap_certificate_id` is not specified."
//  default     = ""
//}
//
//variable "http_domain_realserver_certificate_ids" {
//  description = "The list of GAAP HTTP domain realserver certificate ID use to launch resources."
//  type        = list(string)
//  default     = null
//}
//
//variable "http_domain_realserver_certificate_name" {
//  description = "The GAAP HTTP domain realserver certificate name when `http_domain_realserver_certificate_ids` is not specified."
//  default     = "tf-module-hd-rs-certificate"
//}
//
//variable "http_domain_realserver_certificate_contents" {
//  description = "The list of GAAP HTTP domain client certificate content when `http_domain_realserver_certificate_ids` is not specified."
//  type        = list(string)
//  default     = []
//}
//
//variable "http_domain_realserver_certificate_domain" {
//  description = "The GAAP HTTP domain realserver certificate domain when `http_domain_realserver_certificate_ids` is not specified."
//  default     = ""
//}
//
//variable "realserver_tags" {
//  description = "The tags of GAAP realserver."
//  type        = map(string)
//  default     = {}
//}
//
//variable "realserver_ids" {
//  description = "The list of GAAP realserver ID to launch resources."
//  type        = list(string)
//  default     = []
//}
//
//variable "realserver_name" {
//  description = "Specified the GAAP realserver name to launch resources when `realserver_ids` is not specified."
//  default     = "tf-module-realserver"
//}
//
//variable "realserver_project_id" {
//  description = "Specified the GAAP realserver project ID to launch resources when `realserver_ids` is not specified."
//  default     = 0
//}
//
//variable "realserver_ips" {
//  description = "Specified the list of GAAP realserver IP, when `realserver_ids` is not specified, will use to launch new realserver resource."
//  type        = list(string)
//  default     = []
//}
//
//variable "realserver_domains" {
//  description = "Specified the list of GAAP realserver domain, when `realserver_ids` is not specified, will use to launch new realserver resource."
//  type        = list(string)
//  default     = []
//}
//
//variable "realserver_bind_port" {
//  description = "The list of realserver port which will bind to a layer4 listener or HTTP rule."
//  type        = list(number)
//  default     = []
//}
//
//variable "realserver_bind_weight" {
//  description = "The list of realserver weight which will bind to a layer4 listener or HTTP rule."
//  type        = list(number)
//  default     = []
//}
//
//variable "domain_error_page_body" {
//  description = "Specify the GAAP error page body."
//  default     = ""
//}
//
//variable "domain_error_page_error_codes" {
//  description = "Specify the GAAP error page original error codes."
//  type        = list(number)
//  default     = []
//}
//
//variable "domain_error_page_clear_headers" {
//  description = "Specify the GAAP error page remove headers."
//  type        = list(string)
//  default     = []
//}
//
//variable "domain_error_page_new_error_code" {
//  description = "Specify the GAAP error page new error code."
//  type        = number
//  default     = null
//}
//
//variable "domain_error_page_set_headers" {
//  description = "Specify the GAAP error page new response headers."
//  type        = map(string)
//  default     = {}
//}