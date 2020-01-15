variable "tags" {
  description = "The tags of GAAP realserver."
  type        = map(string)
  default     = {}
}

variable "realserver_ids" {
  description = "The list of GAAP realserver ID to launch resources."
  type        = list(string)
  default     = []
}

variable "realserver_name" {
  description = "Specify the GAAP realserver name to launch resources when `realserver_ids` is not specified."
  default     = "tf-module-realserver"
}

variable "realserver_project_id" {
  description = "Specify the GAAP realserver project ID to launch resources when `realserver_ids` is not specified."
  default     = 0
}

variable "realserver_ips" {
  description = "Specified the list of GAAP realserver IP to launch new realserver resource when `realserver_ids` is not specified."
  type        = list(string)
  default     = []
}

variable "realserver_domains" {
  description = "Specified the list of GAAP realserver domain to launch new realserver resource when `realserver_ids` is not specified."
  type        = list(string)
  default     = []
}

variable "realserver_bind_ports" {
  description = "The list of realserver port which will bind to a layer4 listener or HTTP rule."
  type        = list(number)
  default     = []
}

variable "realserver_bind_weights" {
  description = "The list of realserver weight which will bind to a layer4 listener or HTTP rule."
  type        = list(number)
  default     = []
}