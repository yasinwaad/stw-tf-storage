output "storage_account_ids" {
  description = "Map of storage account IDs, keyed by the names in storage_accounts."
  value       = { for key, account in azurerm_storage_account.this : key => account.id }
}

output "storage_account_names" {
  description = "Map of storage account names, keyed by the names in storage_accounts."
  value       = { for key, account in azurerm_storage_account.this : key => account.name }
}

output "storage_container_names" {
  description = "Map of storage container names."
  value       = { for key, container in azurerm_storage_container.this : key => container.name }
}