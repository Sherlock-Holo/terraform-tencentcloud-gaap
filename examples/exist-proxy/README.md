# GAAP Module Example

This module will create a new GAAP layer4 listener, layer7 listener, HTTP domain and HTTP rule with exists GAAP proxy.

## Usage

To run this example, you need first replace the configuration like `layer4_listener_name`, `layer7_listener_name` etc, and then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| proxy_id | GAAP proxy ID. |
| layer4_listener_id | GAAP layer4 listener ID. |
| layer7_listener_id | GAAP layer7 listener ID. |
| realserver_ids | A list of GAAP realserver ID. |
