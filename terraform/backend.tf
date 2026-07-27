# ---------------------------------------------------------------------------
# Remote state backend (Azure Blob Storage)
# Author : Sanjay Naidu (https://github.com/Sanjay-Naidu/project02-aks-platform-infra)
# ---------------------------------------------------------------------------
# Partial config on purpose - concrete values (resource_group_name,
# storage_account_name, container_name, key) are passed at `terraform init`
# time via -backend-config flags from the GitHub workflow, so environment-
# specific names stay out of source control.
#
# use_oidc + use_azuread_auth => Terraform reaches the state storage account
# using the same OIDC identity as the rest of the pipeline - no storage key.

terraform {
  backend "azurerm" {
    use_oidc         = true
    use_azuread_auth = true
  }
}
