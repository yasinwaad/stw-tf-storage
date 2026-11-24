variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "environment" {
  description = "Environment name, e.g. prod."
  type        = string
}

variable "owner" {
  description = "Owner tag value."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "southafricanorth"

  validation {
    condition     = var.location == "southafricanorth"
    error_message = "Location must be southafricanorth."
  }
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "is_production" {
  description = "Use the Premium tier when true, Standard when false."
  type        = bool
  default     = false
}

variable "storage_accounts" {
  description = "Map of storage accounts. The key is used in the name, and containers is the list of container names to create."
  type = map(object({
    replication = optional(string, "LRS")
    containers  = optional(list(string), [])
  }))
  default = {}
}