# TencentCloud GAAP module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP layer7 listener.

The following resources are included.

* [GAAP proxy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_proxy.html)
* [GAAP realserver](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_realserver.html)
* [GAAP layer7 listener](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_layer7_listener.html)
* [GAAP HTTP domain](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_http_domain.html)
* [GAAP HTTP rule](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_http_rule.html)
* [GAAP domain error page](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_domain_error_page.html)

## Usage

```hcl
module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/layer7"

  proxy_name              = "simple-proxy"
  proxy_access_region     = "EastChina"
  proxy_realserver_region = "SouthChina"
  proxy_concurrent        = 2
  proxy_bandwidth         = 10

  layer7_listener_name             = "simple-HTTPS-listener"
  layer7_listener_protocol         = "HTTPS"
  layer7_listener_forward_protocol = "HTTPS"
  layer7_listener_auth_type        = 0
  layer7_listener_port             = 443

  layer7_certificate_content = file("public1.pem")
  layer7_certificate_key     = file("pkey.pem")

  http_domain                             = "www.qq.com"
  http_domain_client_certificate_contents = [file("public1.pem"), file("public2.pem")]

  http_rule_domain          = "www.qq.com"
  http_rule_path            = "/"
  http_rule_realserver_type = "IP"

  realserver_ips         = ["1.1.1.1", "8.8.8.8"]
  realserver_bind_port   = [80, 80]
  realserver_bind_weight = [1, 1]
}
```

## Conditional Creation

This module can create GAAP layer7 listener.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project_id | Specify the project id. | integer | 0 | no |
| tags | Specify the tags. | map(string) | {} | no |
| proxy_id | Specify the GAAP proxy ID to launch resources. | string | "" | no |
| proxy_name | Specify the GAAP proxy name to launch a GAAP proxy when `proxy_id` is not specified. | string | "tf-module-proxy" | no |
| access_region | Specify the GAAP proxy access region to launch a GAAP proxy when `proxy_id` is not specified. | string | "" | no |
| realserver_region | Specify the GAAP proxy realserver region to launch a GAAP proxy when `proxy_id` is not specified. | string | "" | no |
| bandwidth | Specify the GAAP proxy bandwidth to launch a GAAP proxy when `proxy_id` is not specified. | integer | null | no |
| concurrent | Specify the GAAP proxy concurrent to launch a GAAP proxy when `proxy_id` is not specified. | integer | null | no |
| listener_id | Specify the GAAP layer7 listener ID to launch resources. | string | "" | no |
| name | The GAAP layer7 listener name used to launch a new layer7 listener when `listener_id` is not specified. | string | tf-module-layer7-listener | no |
| port | The GAAP layer7 listener port used to launch a new layer7 listener when `listener_id` is not specified. | integer | null | no |
| protocol | The GAAP layer7 listener protocol used to launch a new layer7 listener when `listener_id` is not specified, available values: `HTTP` and `HTTPS`. | string | "" | no |
| auth_type | The GAAP layer7 listener auth type used to launch a new layer7 listener when `listener_id` is not specified, available values: `0` and `1`. | integer | null | no |
| forward_protocol | The GAAP layer7 listener forward protocol used to launch a new layer7 listener when `listener_id` is not specified, available values: `HTTP` and `HTTPS`. | string | null | no |
| http_domain_id | The GAAP HTTP domain ID to launch resources. | string | "" | no |
| http_domain | Specify GAAP HTTP domain to launch resources when `http_domain_id` is not specified. | string | "" | no |
| basic_auth | Specify if enable the GAAP HTTP domain basic auth or not when `http_domain_id` is not specified. | boll | false | no |
| gaap_auth | Specify if enable the GAAP HTTP domain proxy auth or not when `http_domain_id` is not specified. | bool | false | no |
| realserver_auth | Specify if enable the GAAP HTTP domain realserver auth or not when `http_domain_id` is not specified. | bool | false | no |
| http_rule_id | The GAAP HTTP rule ID to launch resources. | string | "" | no |
| http_rule_domain | Specify the GAAP HTTP rule domain when `http_rule_id` is not specified. | string | "" | no |
| health_check | Specify if enable the GAAP HTTP rule health check or not when `http_rule_id` is not specified. | bool | false | no |
| path | Specify the GAAP HTTP rule path when `http_rule_id` is not specified. | string | null | no |
| realserver_type | Specify the GAAP HTTP rule realserver type when `http_rule_id` is not specified, available values: `IP` and `DOMAIN`. | string | null | no |
| connect_timeout | Specify the GAAP HTTP rule connect timeout when `http_rule_id` is not specified. | integer | 2 | no |
| http_rule_forward_host | Specify the GAAP HTTP rule forward host when `http_rule_id` is not specified. | string | "default" | no |
| health_check_method | Specify the GAAP HTTP rule health check method when `http_rule_id` is not specified, available values: `GET` and `POST`. | string | null | no |
| health_check_path | Specify the GAAP HTTP rule health check path when `http_rule_id` is not specified. | string | null | no |
| health_check_status_codes | The list of GAAP HTTP rule health check status code when `http_rule_id` is not specified. | list(number) | null | no |
| interval | Specify the GAAP HTTP rule health check interval when `http_rule_id` is not specified. | number | 5 | no |
| scheduler | Specify the GAAP HTTP rule scheduler when `http_rule_id` is not specified, available values: `rr`, `wrr` and `lc`. | string | "rr" | no |
| create_realserver | Specify create new realservers with specified config in `realservers` or not. |       bool        |              false              | no |
| realserver_name | Specify the realserver name when `create_realserver` is `true`. | string | "tf-module-realserver" | no |
| realservers | The list of GAAP layer4 listener binding realserver config, each map contains `id`, `ip`, `domain` and `port`. If not specify `weight`, will use default value `1`; If `create_realserver` is `true`, `id` will be ignored. | list(map(string)) | [] | no |
| listener_certificate_id | The GAAP layer7 listener certificate ID use to launch resources. | string | "" | no |
| listener_certificate_name | The GAAP layer7 certificate name when `listener_certificate_id` is not specified. | string | "tfmodule-listener-cert" | no |
| listener_certificate_content | The GAAP layer7 certificate content when `listener_certificate_id` is not specified. | string | "" | no |
| listener_certificate_key | The GAAP layer7 certificate key when `listener_certificate_id` is not specified. | string | "" | no |
| listener_client_certificate_id | The GAAP layer7 listener client certificate ID use to launch resources. | string | "" | no |
| listener_client_certificate_name | The GAAP layer7 listener client certificate name when `listener_client_certificate_id` is not specified. | string | "tfmodule-listener-client-cert" | no |
| listener_client_certificate_content | The GAAP layer7 listener client certificate content when `listener_client_certificate_id` is not specified. | string | "" | no |
| http_domain_certificate_id | The GAAP HTTP domain certificate ID use to launch resources. | string | "default" | no |
| http_domain_certificate_name | The GAAP HTTP domain certificate name when `http_domain_certificate_id` is not specified. | string | "tfmodule-hd-cert" | no |
| http_domain_certificate_content | The GAAP HTTP domain certificate content when `http_domain_certificate_id` is not specified. | string | "" | no |
| http_domain_certificate_key | The GAAP HTTP domain certificate key when `http_domain_certificate_id` is not specified. | string | "" | no |
| http_domain_client_certificate_id | The GAAP HTTP domain certificate ID use to launch resources. | string | "default" | no |
| http_domain_client_certificate_name | The GAAP HTTP domain client certificate name when `http_domain_client_certificate_id` is not specified. | string | "tfmodule-hd-client-cert" | no |
| http_domain_client_certificate_content | The GAAP HTTP domain client certificate content when `http_domain_client_certificate_id` is not specified. | string | "" | no |
| http_domain_basic_auth_id | The GAAP HTTP domain basic auth ID use to launch resources. | string | "" | no |
| http_domain_basic_auth_name | The GAAP HTTP domain basic auth name when `http_domain_basic_auth_id` is not specified. | string | "tfmodule-hd-basic-cert" | no |
| http_domain_basic_auth_content | The GAAP HTTP domain basic auth content when `http_domain_basic_auth_id` is not specified. | string | "" | no |
| http_domain_gaap_certificate_id | The GAAP HTTP domain proxy certificate name when `http_domain_gaap_certificate_id` is not specified. | string | "" | no |
| http_domain_gaap_certificate_name | Specify the GAAP error page remove headers. | string | "tfmodule-hd-proxy-cert" | no |
| http_domain_gaap_certificate_content | The GAAP HTTP domain proxy certificate content when `http_domain_gaap_certificate_id` is not specified. | string | "" | no |
| http_domain_gaap_certificate_key | The GAAP HTTP domain proxy certificate key when `http_domain_gaap_certificate_id` is not specified. | string | "" | no |
| http_domain_realserver_certificate_id | The GAAP HTTP domain realserver certificate ID use to launch resources. | string | "" | no |
| http_domain_realserver_certificate_name | The GAAP HTTP domain realserver certificate name when `http_domain_realserver_certificate_id` is not specified. | string | "tfmodule-hd-proxy-cert" | no |
| http_domain_realserver_certificate_content | The GAAP HTTP domain realserver certificate content when `http_domain_realserver_certificate_id` is not specified. | string | "" | no |
| http_domain_realserver_certificate_domain | The GAAP HTTP domain realserver certificate domain when `http_domain_realserver_certificate_id` is not specified. | string | "" | no |
| domain_error_page_body | Specify the GAAP error page body. | string | "" | no |
| domain_error_page_error_codes | Specify the GAAP error page original error codes. | list(integer) | [] | no |
| domain_error_page_clear_headers | Specify the GAAP error page remove headers. | list(string) | [] | no |
| domain_error_page_new_error_code | Specify the GAAP error page new error code. | integer | null | no |
| domain_error_page_set_headers | Specify the GAAP error page new response headers. | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| listener_id | The list of GAAP layer7 listener ID. |
| http_domain_id | The list of GAAP HTTP domain ID. |
| http_rule_id | The list of GAAP HTTP rule ID. |
| listener_certificate_id | The list of GAAP layer7 listener certificate ID. |
| listener_client_certificate_id | The list of GAAP layer7 listener client certificate ID. |
| http_domain_certificate_id | The list of GAAP HTTP domain certificate ID. |
| http_domain_client_certificate_id | The list of GAAP HTTP domain client certificate ID. |
| http_domain_gaap_certificate_id | The list of GAAP HTTP domain proxy certificate ID. |
| http_domain_basic_auth_id | The list of GAAP HTTP domain basic auth ID. |
| http_domain_realserver_certificate_id | The list of GAAP HTTP domain realserver certificate ID. |
| domain_error_page_id | The list of GAAP domain error page ID. |


## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.