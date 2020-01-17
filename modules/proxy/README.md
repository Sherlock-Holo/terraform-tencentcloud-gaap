# TencentCloud GAAP Module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP proxy.

The following resources are included.

* [GAAP proxy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_proxy.html)
* [GAAP security policy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_security_policy.html)
* [GAAP security policy rule](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_security_rule.html)

## Usage

```hcl
module "simple-proxy" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/proxy"

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  policy_action = "DROP"

  policy_rules = [
    {
      cidr_ip = "1.1.1.0/24"
      action  = "ACCEPT"
    }
  ]
}
```

## Conditional Creation

This module can create GAAP proxy.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| tags | A map of tags to add to GAAP proxy. | map(string) | {} | no|
| proxy_id | The GAAP proxy ID use to launch resources. | string | "" | no|
| name | The proxy name used to launch a new proxy when `proxy_id` is not specified. | string | "tf-modules-proxy" | no|
| access_region | The proxy access region used to launch a new proxy when `proxy_id` is not specified. | string | "" | no|
| realserver_region | The proxy realserver region used to launch a new proxy when `proxy_id` is not specified. | string | "" | no|
| bandwidth | The proxy bandwidth used to launch a new proxy when `proxy_id` is not specified. | integer | null | no|
| concurrent | The proxy concurrent used to launch a new proxy when `proxy_id` is not specified. | integer | null | no|
| project_id | The proxy project ID used to launch a new proxy when `proxy_id` is not specified. | integer | 0 | no|
| policy_id | The GAAP proxy security policy ID use to launch resources. | string | "" | no|
| policy_action | Specify action of the GAAP proxy security policy to launch resources when `policy_id` is not specified, available values: `ACCEPT` and `DROP`. | string | "" | no|
| policy_rule_name | Specify the GAAP proxy security policy rule name to launch resources. | string | "tf-modules-policy-rule" | no|
| policy_rules | Specify the GAAP proxy security policy rule config, each map contains `action`, `cidr_ip`, `port` and `protocl`. If `port` omitted, will use default value `ALL`; if `protocol` is omitted, will use default value `ALL`. | list(map(string)) | [] | no|

## Outputs

| Name | Description |
|------|-------------|
| proxy_id | The list of GAAP proxy ID. |
| policy_id | The list of GAAP proxy policy ID. |
| policy_rule_ids | The list of GAAP proxy policy rule ID. |

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.