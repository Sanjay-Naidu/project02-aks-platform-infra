# ---------------------------------------------------------------------------
# Provider & Terraform version pinning
# Project : project02-aks-platform-infra
# Author  : Sanjay Naidu (https://github.com/Sanjay-Naidu/project02-aks-platform-infra)
# ---------------------------------------------------------------------------
# Credentials are never hardcoded here. In CI, GitHub Actions injects
# ARM_CLIENT_ID / ARM_TENANT_ID / ARM_SUBSCRIPTION_ID and ARM_USE_OIDC=true,
# so Terraform authenticates via a short-lived OIDC token (no secret).

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
