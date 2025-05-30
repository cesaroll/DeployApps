variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
  default     = "b6ed944c-054e-45ed-b5b7-f7e255b3524b"
}

variable "src_key" {
  type        = string
  description = "The infra source"
  default     = "terraform"
}

variable "location" {
  type        = string
  description = "The Azure region for resources"
  default     = "North Europe"
}

variable "env_id" {
  type        = string
  description = "The environment ID"
  default     = "dev"
}

# variable "sql_admin_password" {
#   type        = string
#   description = "The SQL DB admin password"
# }




