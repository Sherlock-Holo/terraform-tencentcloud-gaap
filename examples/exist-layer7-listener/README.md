# GAAP Module Example

This module will create a new GAAP HTTP domain, HTTP rule, HTTPS domain and HTTPS rule with exists GAAP layer7 listeners.

## Usage

To run this example, you need first replace the configuration like `http_domain`, `http_rule_domain` etc, and then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| http_listener_id | The list of GAAP HTTP listener ID. |
| http_rule_id | The list of GAAP HTTP rule ID. |
| https_listener_id | The list of GAAP HTTPS listener ID. |
| https_rule_id | The list of GAAP HTTPS rule ID. |
| http_domain_error_page_id | The list of GAAP HTTP domain error page ID. |
| https_domain_error_page_id | The list of GAAP HTTPS domain error page ID. |
