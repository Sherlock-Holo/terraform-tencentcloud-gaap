# TencentCloud GAAP Module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP listener.

The following resources are included.

* [GAAP realserver](https://www.terraform.io/docs/providers/tencentcloud/r/gaap_realserver.html)

## Usage

```hcl
module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/realserver"

  realserver_tags = {
    "test" : "test"
  }

  realserver_ips = [
    "1.1.1.1",
    "8.8.8.8"
  ]
}
```

## Conditional Creation

This module can create GAAP realserver.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| realserver_name | Specified the GAAP realserver name to launch resources when `realserver_ids` is not specified. | string | "tf-module-realserver" | no |
| realserver_project_id | Specified the GAAP realserver project ID to launch resources when `realserver_ids` is not specified. | integer | 0 | no |
| realserver_ips | Specified the list of GAAP realserver IP, when `realserver_ids` is not specified, will use to launch new realserver resource. | list(string) | [] | no |
| realserver_domains | Specified the list of GAAP realserver domain, when `realserver_ids` is not specified, will use to launch new realserver resource. | list(string) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| realserver_ids | The list of realserver ID. |
| realserver_address | The list of realserver address. |

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.