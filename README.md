# stw-tf-storage

Terraform module that generates one or more Azure Storage Accounts and their containers.

## Usage

```hcl
module "storage" {
  source = "git::https://github.com/yasinwaad/stw-tf-storage.git?ref=v1.0.0"

  project_name        = "example"
  environment         = "dev"
  owner               = "Yasin"
  resource_group_name = "rg-example-dev-southafricanorth"

  storage_accounts = {
    syslog = {
      containers = ["syslog"]
    }
  }
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_name | Project name used in resource names | string | n/a |
| environment | Environment name, e.g. prod | string | n/a |
| owner | Owner tag value | string | n/a |
| resource_group_name | Name of the existing resource group | string | n/a |
| location | Azure region (only southafricanorth allowed) | string | southafricanorth |
| is_production | Premium tier when true, Standard when false | bool | false |
| storage_accounts | Map of storage accounts, key is used in the