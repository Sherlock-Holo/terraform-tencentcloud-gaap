# TencentCloud GAAP Module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP proxy.

The following resources are included.

* [GAAP proxy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_proxy.html)
* [GAAP security policy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_security_policy.html)
* [GAAP security policy rule](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_security_rule.html)

## Usage

```hcl
module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/proxy"

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
}
```

## Conditional Creation

This module can create GAAP proxy.

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

## Outputs

| Name | Description |
|------|-------------|
| proxy_id | The list of GAAP proxy ID. |

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.