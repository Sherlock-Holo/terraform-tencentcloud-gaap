# GAAP Module Example

This module will create a new GAAP proxy, TCP listener and HTTPS listener.

## Usage

To run this example, you need first replace the configuration like `proxy_name`, `proxy_access_region` and `proxy_realserver_region` etc, and then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| proxy_id | The list of GAAP proxy ID. |
| layer4_listener_id | The list of GAAP layer4 listener ID. |
| layer7_listener_id | The list of GAAP layer7 listener ID. |
| realserver_ids | The list of GAAP realserver ID. |
| domain_error_page_id | The list of GAAP domain error page ID. |
