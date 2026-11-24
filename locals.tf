locals {
  storage_account_names = {
    for key, account in var.storage_accounts :
    key => lower(substr(replace("st${key}${var.project_name}${var.environment}${var.location}", "-", ""), 0, 24))
  }

  containers = merge([
    for key, account in var.storage_accounts : {
      for container in account.containers :
      "${key}-${container}" => {
        account   = key
        container = container
      }
    }
  ]...)

  common_tags = {
    project = var.project_name
    owner   = var.owner
  }
}