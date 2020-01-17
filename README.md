# TencentCloud GAAP Module for Terraform

## terraform-tencentcloud-gaap

A terraform module used to create TencentCloud GAAP resources.

The following resources are supported.

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

### GAAP proxy

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

### GAAP layer4

```hcl
module "realserver" {
  source = "terraform-tencentcloud-modules/gaap/tencentcloud//modules/layer4"

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  name            = "simple-TCP-listener"
  protocol        = "TCP"
  port            = 80
  realserver_type = "IP"

  create_realserver = true

  realservers = [
    {
      ip     = "1.1.1.1"
      port   = 80
    }
  ]
}
```

### GAAP layer7

```hcl
module "simple-http" {
  source = "tencentcloud-modules/gaap/tencentcloud//modules/layer7"

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  protocol        = "HTTP"
  port            = 80
  realserver_type = "IP"

  http_domain = "www.qq.com"

  create_realserver = true

  realservers = [
    {
      ip   = "1.1.1.1"
      port = 80
    }
  ]
}
```

## Examples

- [simple GAAP proxy](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-gaap/tree/master/examples/proxy)
- [simple GAAP layer4](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-gaap/tree/master/examples/layer4)
- [simple GAAP layer7](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-gaap/tree/master/examples/layer7/simple-http)
- [complex GAAP layer7](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-gaap/tree/master/examples/layer7/complex-https)

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
