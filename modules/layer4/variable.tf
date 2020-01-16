variable "project_id" {
  description = "Specify the project id."
  default = 0
}

variable "tags" {
  description = "Specify the tags."
  type = map(string)
  default = {}
}

variable "proxy_id" {
  description = "Specify the GAAP proxy ID to launch resources."
  default = ""
}

variable "proxy_name" {
  description = "Specify the GAAP proxy name to launch a GAAP proxy when `proxy_id` is not specified."
  default = "tf-module-proxy"
}

variable "access_region" {
  description = "Specify the GAAP proxy access region to launch a GAAP proxy when `proxy_id` is not specified."
  default = ""
}

variable "realserver_region" {
  description = "Specify the GAAP proxy realserver region to launch a GAAP proxy when `proxy_id` is not specified."
  default = ""
}

variable "bandwidth" {
  description = "Specify the GAAP proxy bandwidth to launch a GAAP proxy when `proxy_id` is not specified."
  type = number
  default = null
}

variable "concurrent" {
  description = "Specify the GAAP proxy concurrent to launch a GAAP proxy when `proxy_id` is not specified."
  type = number
  default = null
}

variable "protocol" {
  description = "The GAAP layer4 listener protocol used to launch a new layer4 listener, available values: `TCP` and `UDP`."
  type = string
}

variable "name" {
  description = "The GAAP layer4 listener name used to launch a new layer4 listener."
  default = "tf-module-layer4-listener"
}

variable "port" {
  description = "The GAAP layer4 listener port used to launch a new layer4 listener."
  type = number
}

variable "realserver_type" {
  description = "The GAAP layer4 listener realserver type used to launch a new layer4 listener, available values: `IP` and `DOMAIN`."
  type = string
}

variable "connect_timeout" {
  description = "The GAAP layer4 listener connect timeout used to launch a new layer4 listener."
  type = number
  default = null
}

variable "health_check" {
  description = "Enable the GAAP layer4 listener health check or not used to launch a new layer4 listener."
  default = false
}

variable "health_check_interval" {
  description = "The GAAP layer4 listener health check interval used to launch a new layer4 listener."
  type = number
  default = null
}

variable "scheduler" {
  description = "The GAAP layer4 listener scheduler used to launch a new layer4 listener, available values: `rr`, `wrr` and `lc`."
  type = string
  default = "rr"
}

variable "create_realserver" {
  description = "Specify create new realservers with specified config in `realservers` or not."
  default = false
}

variable "realserver_name" {
  description = "Specify the realserver name when `create_realserver` is `true`."
  default = "tf-module-realserver"
}

variable "realservers" {
  description = "The list of GAAP layer4 listener binding realserver config, each map contains `id`, `ip`, `domain` and `port`. If not specify `weight`, will use default value `1`; If `create_realserver` is `true`, `id` will be ignored."
  type = list(map(string))
  default = []
}
