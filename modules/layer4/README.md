# TencentCloud GAAP Module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP layer4 listener.

The following resources are included.

* [GAAP proxy](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_proxy.html)
* [GAAP realserver](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_realserver.html)
* [GAAP layer4 listener](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_layer4_listener.html)

## Usage

### with exist GAAP proxy

```hcl
resource "tencentcloud_gaap_proxy" "default" {
  name              = "default proxy"
  bandwidth         = 10
  concurrent        = 2
  access_region     = "SouthChina"
  realserver_region = "NorthChina"
}

module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/layer4"

  proxy_id = tencentcloud_gaap_proxy.default.id

  name            = "simple-TCP-listener"
  protocol        = "TCP"
  port            = 80
  realserver_type = "IP"

  scheduler = "wrr"

  create_realserver = true

  realservers = [
    {
      ip     = "1.1.1.1"
      port   = 80
      weight = 10
    },
    {
      ip     = "8.8.8.8"
      port   = 80
      weight = 15
    }
  ]
}
```

### without exist GAAP proxy

```hcl
module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/layer4"

  tags = {
    "test" = "test"
  }

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  name            = "simple-TCP-listener"
  protocol        = "TCP"
  port            = 80
  realserver_type = "IP"

  scheduler = "wrr"

  create_realserver = true

  realservers = [
    {
      ip     = "1.1.1.1"
      port   = 80
      weight = 10
    },
    {
      ip     = "8.8.8.8"
      port   = 80
      weight = 15
    }
  ]
}
```

### with exist GAAP realservers

```hcl
module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/layer4"

  tags = {
    "test" = "test"
  }

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  name            = "simple-TCP-listener"
  protocol        = "TCP"
  port            = 80
  realserver_type = "IP"

  scheduler = "wrr"

  realservers = [
    {
      id     = tencentcloud_gaap_realserver.rs1.id
      ip     = tencentcloud_gaap_realserver.rs1.ip
      port   = 80
      weight = 10
    },
    {
      id     = tencentcloud_gaap_realserver.rs2.id
      ip     = tencentcloud_gaap_realserver.rs2.ip
      port   = 80
      weight = 15
    }
  ]
}

resource "tencentcloud_gaap_realserver" "rs1" {
  ip   = "1.1.1.1"
  name = "tf-module-realserver"
}

resource "tencentcloud_gaap_realserver" "rs2" {
  ip   = "8.8.8.8"
  name = "tf-module-realserver"
}
```

## Conditional Creation

This module can create GAAP layer4 listener.

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
| protocol | The GAAP layer4 listener protocol used to launch a new layer4 listener, available values: `TCP` and `UDP`. | string |  | yes |
| name | The GAAP layer4 listener name used to launch a new layer4 listener. | string | tf-module-layer4-listener | no |
| port | The GAAP layer4 listener port used to launch a new layer4 listener. | integer |  | yes |
| realserver_type | The GAAP layer4 listener realserver type used to launch a new layer4 listener, available values: `IP` and `DOMAIN`. | string |  | yes |
| connect_timeout | The GAAP layer4 listener connect timeout used to launch a new layer4 listener. | integer | null | no |
| health_check | Enable the GAAP layer4 listener health check or not used to launch a new layer4 listener. | bool | false | no |
| health_check_interval | The GAAP layer4 listener health check interval used to launch a new layer4 listener. | integer | null | no |
| scheduler | The GAAP layer4 listener scheduler used to launch a new layer4 listener, available values: `rr`, `wrr` and `lc`. | string | "rr" | no |
| create_realserver | Specify create new realservers with specified config in `realservers` or not. | boll | false | no |
| realserver_name | Specify the realserver name when `create_realserver` is `true`. | string | "tf-module-realserver" | no |
| realservers | The list of GAAP layer4 listener binding realserver config, each map contains `id`, `ip`, `domain` and `port`. If not specify `weight`, will use default value `1`; If `create_realserver` is `true`, `id` will be ignored. | list(map(string)) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| proxy_id | The GAAP proxy ID. |
| listener_id | The GAAP layer4 listener ID. |
| realserver_ids | The list of GAAP realserver ID. |

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.