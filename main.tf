resource "azurerm_storage_account" "this" {
  for_each = var.storage_accounts

  name                     = local.storage_account_names[each.key]
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.is_production ? "Premium" : "Standard"
  account_replication_type = each.value.replication
  tags                     = local.common_tags
}

resource "azurerm_storage_container" "this" {
  for_each = local.containers

  name               = each.value.container
  storage_account_id = azurerm_storage_account.this[each.value.account].id
}