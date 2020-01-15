# TencentCloud GAAP Module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP proxy, listener, HTTP domain and HTTP rule.

The following resources are included.

* [GAAP proxy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_proxy.html)
* [GAAP security policy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_security_policy.html)
* [GAAP security policy rule](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_security_rule.html)
* [GAAP realserver](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_realserver.html)
* [GAAP certificate](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_certificate.html)
* [GAAP layer4 listener](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_layer4_listener.html)
* [GAAP layer7 listener](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_layer7_listener.html)
* [GAAP HTTP domain](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_http_domain.html)
* [GAAP HTTP rule](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_http_rule.html)
* [GAAP domain error page](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_domain_error_page.html)

## Usage

```hcl
module "layer4_listener" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud"

  proxy_name              = "simple-proxy"
  proxy_access_region     = "EastChina"
  proxy_realserver_region = "SouthChina"
  proxy_concurrent        = 2
  proxy_bandwidth         = 10

  proxy_tags = {
    "test" : "test"
  }

  proxy_security_policy_action = "ACCEPT"

  proxy_security_policy_rule_name      = "simple rule"
  proxy_security_policy_rule_action    = ["ACCEPT", "DROP"]
  proxy_security_policy_rule_cidr_ips  = ["1.1.1.1", "2.2.2.2"]
  proxy_security_policy_rule_ports     = ["80", "80,90"]
  proxy_security_policy_rule_protocols = ["TCP", "UDP"]


  layer4_listener_name            = "simple-TCP-listener"
  layer4_listener_protocol        = "TCP"
  layer4_listener_port            = 80
  layer4_listener_realserver_type = "IP"

  layer4_listener_scheduler = "wrr"

  realserver_tags = {
    "test" : "test"
  }

  realserver_ips = [
    "1.1.1.1",
    "8.8.8.8"
  ]
  realserver_bind_port = [
    80,
    80
  ]
  realserver_bind_weight = [
    1,
    10
  ]
}
```

## Conditional Creation

This module can create GAAP proxy, listener, HTTP domain and HTTP rule.
It is possible to use existing GAAP proxy when specify `proxy_id` parameter.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| tags | Global tags to add to all resources. | map(string) | {} | no|
| proxy_tags | The tags of GAAP proxy. | map(string) | {} | no|
| proxy_id | The GAAP proxy ID use to launch resources. | string | "" | no|
| proxy_name | The proxy name used to launch a new proxy when `proxy_id` is not specified. | string | "tf-modules-proxy" | no|
| proxy_access_region | The proxy access region used to launch a new proxy when `proxy_id` is not specified. | string | "" | no|
| proxy_realserver_region | The proxy realserver region used to launch a new proxy when `proxy_id` is not specified. | string | "" | no|
| proxy_bandwidth | The proxy bandwidth used to launch a new proxy when `proxy_id` is not specified. | integer | null | no|
| proxy_concurrent | The proxy concurrent used to launch a new proxy when `proxy_id` is not specified. | integer | null | no|
| proxy_project_id | The proxy project ID used to launch a new proxy when `proxy_id` is not specified. | integer | 0 | no|
| proxy_enable | Enable the proxy or not when `proxy_id` is not specified. | bool | true | no|
| proxy_security_policy_id | The GAAP proxy security policy ID use to launch resources. | string | "" | no|
| proxy_security_policy_enable | Specify enable the GAAP proxy security policy or not when `proxy_security_policy_id` is not specified. | bool | true | no|
| proxy_security_policy_action | Specify action of the GAAP proxy security policy to launch resources when `proxy_security_policy_id` is not specified, available values: `ACCEPT` and `DROP`. | string | "" | no|
| proxy_security_policy_rule_name | Specify the GAAP proxy security policy rule name to launch resources. | string | "tf-modules-policy-rule" | no|
| proxy_security_policy_rule_ports | List of the GAAP proxy security policy rule port. | list(string) | [] | no|
| proxy_security_policy_rule_protocols | List of the GAAP proxy security policy rule protocol. | list(string) | [] | no|
| proxy_security_policy_rule_action | List of the GAAP proxy security policy rule action, available values: `ACCEPT` and `DROP`. | list(string) | [] | no|
| proxy_security_policy_rule_cidr_ips | List of the GAAP proxy security policy rule cidr IP. | list(string) | [] | no|
| layer4_listener_id | Specify the GAAP layer4 listener ID to launch resources. | string | "" | no|
| layer4_listener_protocol | The GAAP layer4 listener protocol used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `TCP` and `UDP`. | string | "" | no |
| layer4_listener_name | The GAAP layer4 listener name used to launch a new layer4 listener when `layer4_listener_id` is not specified. | string | "" | no |
| layer4_listener_port | The GAAP layer4 listener port used to launch a new layer4 listener when `layer4_listener_id` is not specified. | integer | null | no |
| layer4_listener_type | The GAAP layer4 listener type used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `TCP` and `UDP`. | string | null | no |
| layer4_listener_realserver_type | The GAAP layer4 listener realserver type used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `IP` and `DOMAIN`. | string | null | no |
| layer4_listener_connect_timeout | The GAAP layer4 listener connect timeout used to launch a new layer4 listener when `layer4_listener_id` is not specified. | integer | 2 | no |
| layer4_listener_health_check | Enable the GAAP layer4 listener health check or not used to launch a new layer4 listener when `layer4_listener_id` is not specified. | bool | false | no |
| layer4_listener_health_check_interval | The GAAP layer4 listener health check interval used to launch a new layer4 listener when `layer4_listener_id` is not specified. | integer | 5 | no |
| layer4_listener_scheduler | The GAAP layer4 listener scheduler used to launch a new layer4 listener when `layer4_listener_id` is not specified, available values: `rr`, `wrr` and `lc`. | string | null | no |
| layer4_listenere_realservers | The list of the GAAP layer4 listener realserver config when `layer4_listener_id` is not specified, each config must contian key `id`, `ip`, `port` and `weight`. | list(map(string)) | [] | no |
| layer7_listener_id | Specify the GAAP layer4 listener ID to launch resources. | string | "" | no |
| layer7_listener_name | The GAAP layer7 listener name used to launch a new layer7 listener when `layer7_listener_id` is not specified. | string | "" | no |
| layer7_listener_port | The GAAP layer7 listener port used to launch a new layer7 listener when `layer7_listener_id` is not specified. | integer | null | no |
| layer7_listener_protocol | The GAAP layer4 listener protocol used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `HTTP` and `HTTPS`. | string | "" | no |
| layer7_listener_auth_type | The GAAP layer7 listener auth type used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `0` and `1`. | integer | null | no |
| layer7_listener_forward_protocol | The GAAP layer7 listener forward protocol used to launch a new layer7 listener when `layer7_listener_id` is not specified, available values: `HTTP` and `HTTPS`. | string | null | no |
| http_domain_id | The GAAP HTTP domain ID to launch resources. | string | "" | no |
| http_domain | Specify GAAP HTTP domain to launch resources when `http_domain_id` is not specified. | string | "" | no |
| http_domain_basic_auth | Specify if enable the GAAP HTTP domain basic auth or not when `http_domain_id` is not specified. | bool | false | no |
| http_domain_gaap_auth | Specify if enable the GAAP HTTP domain proxy auth or not when `http_domain_id` is not specified. | bool | false | no |
| http_domain_realserver_auth | Specify if enable the GAAP HTTP domain realserver auth or not when `http_domain_id` is not specified. | bool | false | no |
| http_rule_id | The GAAP HTTP rule ID to launch resources. | string | "" | no |
| http_rule_domain | Specify the GAAP HTTP rule domain when `http_rule_id` is not specified. | string | "" | no |
| http_rule_listener | Specify the GAAP HTTP rule layer7 listener when `http_rule_id` is not specified. | string | "" | no |
| http_rule_health_check | Specify if enable the GAAP HTTP rule health check or not when `http_rule_id` is not specified. | bool | false | no |
| http_rule_path | Specify the GAAP HTTP rule path when `http_rule_id` is not specified. | string | null | no |
| http_rule_realserver_type | Specify the GAAP HTTP rule realserver type when `http_rule_id` is not specified, avaliable values: `IP` and `DOMAIN`. | string | null | no |
| http_rule_connect_timeout | Specify the GAAP HTTP rule connect timeout when `http_rule_id` is not specified. | integer | 2 | no |
| http_rule_forward_host | Specify the GAAP HTTP rule forward host when `http_rule_id` is not specified. | string | "default" | no |
| http_rule_health_check_method | Specify the GAAP HTTP rule health check method when `http_rule_id` is not specified, avaliable values: `GET` and `POST`. | string | null | no |
| http_rule_health_check_path | Specify the GAAP HTTP rule health check path when `http_rule_id` is not specified. | string | null | no |
| http_rule_health_check_status_codes | The list of GAAP HTTP rule health check status code when `http_rule_id` is not specified. | list(integer) | null | no |
| http_rule_health_check_interval | Specify the GAAP HTTP rule health check interval when `http_rule_id` is not specified. | integer | 5 | no |
| http_rule_scheduler | Specify the GAAP HTTP rule scheduler when `http_rule_id` is not specified, available values: `rr`, `wrr` and `lc`. | string | null | no |
| http_rule_realservers | The list of the GAAP HTTP rule realserver config when `http_rule_id` is not specified, each config must contian key `id`, `ip`, `port` and `weight`. | list(map(string)) | null | no |
| layer7_certificate_id | The GAAP layer7 listener certificate ID use to launch resources. | string | "" | no |
| layer7_certificate_name | The GAAP layer7 certificate name when `layer7_certificate_id` is not specified. | string | "tf-module-layer7-certificate" | no |
| layer7_certificate_content | The GAAP layer7 certificate content when `layer7_certificate_id` is not specified. | string | "" | no |
| layer7_certificate_key | The GAAP layer7 certificate key when `layer7_certificate_id` is not specified. | string | "" | no |
| layer7_client_certificate_ids | The list of GAAP client certificate ID use to launch resources. | list(string) | null | no |
| layer7_client_certificate_name | The GAAP client certificate name when `layer7_client_certificate_ids` is not specified. | string | "tfmodule-l7-clientcertificate" | no |
| layer7_client_certificate_contents | The list of GAAP client certificate content when `layer7_client_certificate_ids` is not specified. | list(string) | null | no |
| http_domain_certificate_id | The GAAP HTTP domain certificate ID use to launch resources. | string | default | no |
| http_domain_certificate_name | The GAAP HTTP domain certificate name when `http_domain_certificate_id` is not specified. | string | "tf-module-hd-certificate" | no |
| http_domain_certificate_content | The GAAP HTTP domain certificate content when `http_domain_certificate_id` is not specified. | string | "" | no |
| http_domain_certificate_key | The GAAP HTTP domain certificate key when `http_domain_certificate_id` is not specified. | string | "" | no |
| http_domain_client_certificate_ids | The list of GAAP HTTP domain client certificate ID use to launch resources. | list(string) | null | no |
| http_domain_client_certificate_name | The GAAP HTTP domain certificate name when `http_domain_client_certificate_ids` is not specified. | string | "tfmodule-hd-clientcertificate" | no |
| http_domain_client_certificate_contents | The list of GAAP HTTP domain client certificate content when `http_domain_client_certificate_ids` is not specified. | list(string) | [] | no |
| http_domain_basic_auth_id | The GAAP HTTP domain basic auth ID use to launch resources. | string | "" | no |
| http_domain_basic_auth_name | The GAAP HTTP domain basic auth name when `http_domain_basic_auth_id` is not specified. | string | "tfmodule-hd-basic-certificate" | no |
| http_domain_basic_auth_content | The GAAP HTTP domain basic auth content when `http_domain_basic_auth_id` is not specified. | string | "" | no |
| http_domain_gaap_certificate_id | The GAAP HTTP domain proxy certificate ID use to launch resources. | string | "" | no |
| http_domain_gaap_certificate_name | The GAAP HTTP domain proxy certificate name when `http_domain_gaap_certificate_id` is not specified. | string | "tfmodule-hd-proxy-certificate" | no |
| http_domain_gaap_certificate_content | The GAAP HTTP domain proxy certificate content when `http_domain_gaap_certificate_id` is not specified. | string | "" | no |
| http_domain_gaap_certificate_key | The GAAP HTTP domain proxy certificate key when `http_domain_gaap_certificate_id` is not specified. | string | "" | no |
| http_domain_realserver_certificate_ids | The list of GAAP HTTP domain realserver certificate ID use to launch resources. | list(string) | null | no |
| http_domain_realserver_certificate_name | The GAAP HTTP domain realserver certificate name when `http_domain_realserver_certificate_ids` is not specified. | string | "tf-module-hd-rs-certificate" | no |
| http_domain_realserver_certificate_contents | The list of GAAP HTTP domain client certificate content when `http_domain_realserver_certificate_ids` is not specified. | list(string) | [] | no |
| http_domain_realserver_certificate_domain | The GAAP HTTP domain realserver certificate domain when `http_domain_realserver_certificate_ids` is not specified. | string | "" | no |
| realserver_tags | The tags of GAAP realserver. | map(string) | {} | no |
| realserver_ids | The list of GAAP realserver ID to launch resources. | list(string) | [] | no |
| realserver_name | Specified the GAAP realserver name to launch resources when `realserver_ids` is not specified. | string | "tf-module-realserver" | no |
| realserver_project_id | Specified the GAAP realserver project ID to launch resources when `realserver_ids` is not specified. | integer | 0 | no |
| realserver_ips | Specified the list of GAAP realserver IP, when `realserver_ids` is not specified, will use to launch new realserver resource. | list(string) | [] | no |
| realserver_domains | Specified the list of GAAP realserver domain, when `realserver_ids` is not specified, will use to launch new realserver resource. | list(string) | [] | no |
| realserver_bind_port | The list of realserver port which will bind to a layer4 listener or HTTP rule. | list(integer) | [] | no |
| realserver_bind_weight | The list of realserver weight which will bind to a layer4 listener or HTTP rule. | list(integer) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| proxy_id | The list of GAAP proxy ID. |
| layer4_listener_id | The list of GAAP layer4 listener ID. |
| layer7_listener_id | The list of GAAP layer7 listener ID. |
| http_domian_id | The list of GAAP HTTP domain ID. |
| http_rule_id | The list of GAAP HTTP rule ID. |
| layer7_listener_server_certificate_id | The list of GAAP layer7 listener certificate ID. |
| layer7_listener_client_certificate_id | The list of GAAP layer7 listener client certificate ID. |
| http_domain_certificiate_id | The list of GAAP HTTP domain certificate ID. |
| http_domain_client_certificate_id | The list of GAAP HTTP domain client certificate ID. |
| http_domain_gaap_certificate_id | The list of GAAP HTTP domain proxy certificate ID. |
| http_domain_basic_auth_id | The list of GAAP HTTP domain basic auth ID. |
| http_domain_realserver_certificate_id | The list of GAAP HTTP domain realserver certificate ID. |
| realserver_ids | The list of realserver ID. |
| realserver_address | The list of realserver address. |

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
