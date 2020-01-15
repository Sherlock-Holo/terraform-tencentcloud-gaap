variable "proxy_id" {
  description = "Specify the GAAP proxy ID to launch resources."
  default = ""
}

variable "layer4_listener_id" {
  description = "Specify the GAAP layer4 listener ID to launch resources."
  default = ""
}

variable "layer4_listener_protocol" {
  description = "The GAAP layer4 listener protocol used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `TCP` and `UDP`."
  default     = ""
}

variable "layer4_listener_name" {
  description = "The GAAP layer4 listener name used to launch a new layer4 listener when `layer4_listener_id` is not specified."
  default     = ""
}

variable "layer4_listener_port" {
  description = "The GAAP layer4 listener port used to launch a new layer4 listener when `layer4_listener_id` is not specified."
  type        = number
  default     = null
}

variable "layer4_listener_realserver_type" {
  description = "The GAAP layer4 listener realserver type used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `IP` and `DOMAIN`."
  default     = ""
}

variable "layer4_listener_connect_timeout" {
  description = "The GAAP layer4 listener connect timeout used to launch a new layer4 listener when `layer4_listener_id` is not specified."
  type        = number
  default     = null
}

variable "layer4_listener_health_check" {
  description = "Enable the GAAP layer4 listener health check or not used to launch a new layer4 listener when `layer4_listener_id` is not specified."
  default     = false
}

variable "layer4_listener_health_check_interval" {
  description = "The GAAP layer4 listener health check interval used to launch a new layer4 listener when `layer4_listener_id` is not specified."
  type        = number
  default     = null
}

variable "layer4_listener_scheduler" {
  description = "The GAAP layer4 listener scheduler used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `rr`, `wrr` and `lc`."
  type        = string
  default     = "rr"
}

variable "layer4_listener_realserver_ids" {
  description = "The list of the GAAP layer4 listener realserver ID when `layer4_listener_id` is not specified."
  type = list(string)
  default     = []
}

variable "layer4_listener_realserver_address" {
  description = "The list of the GAAP layer4 listener realserver ip or domain when `layer4_listener_id` is not specified."
  type        = list(string)
  default     = []
}

variable "layer4_listener_realserver_ports" {
  description = "The list of the GAAP layer4 listener realserver port when `layer4_listener_id` is not specified."
  type        = list(number)
  default     = []
}

variable "layer4_listener_realserver_weights" {
  description = "The list of the GAAP layer4 listener realserver port when `layer4_listener_id` is not specified."
  type        = list(number)
  default     = []
}