# TencentCloud GAAP Module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP layer4 listener.

The following resources are included.

* [GAAP proxy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_proxy.html)
* [GAAP realserver](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_realserver.html)
* [GAAP layer4 listener](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_layer4_listener.html)

## Usage

```hcl
module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/layer4"

  proxy_name              = "simple-proxy"
  proxy_access_region     = "EastChina"
  proxy_realserver_region = "SouthChina"
  proxy_concurrent        = 2
  proxy_bandwidth         = 10

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

This module can create GAAP layer4 listener.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
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
| layer4_listener_realservers | The list of the GAAP layer4 listener realserver config when `layer4_listener_id` is not specified, each config must contain key `id`, `ip`, `port` and `weight`. | list(map(string)) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| listener_id | The list of GAAP layer4 listener ID. |

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.