# ---------------------------------------------------------------------------
# Input variables
# Author : Sanjay Naidu (https://github.com/Sanjay-Naidu/project02-aks-platform-infra)
# ---------------------------------------------------------------------------
# Trigger: verifying the plan/apply pipeline end-to-end

variable "prefix" {
  description = "Short prefix used to name all resources."
  type        = string
  default     = "project02"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "eastus"
}

variable "node_vm_size" {
  description = "AKS default node pool VM size. Must be on this subscription's eastus allow-list (v7 family)."
  type        = string
  default     = "Standard_D2s_v7"
}

variable "node_count" {
  description = "Fixed node count for the default pool. Kept minimal (no autoscaler) for this phase to control free-trial spend; revisit once ingress/ArgoCD/monitoring are added."
  type        = number
  default     = 1
}

variable "acr_sku" {
  description = "Azure Container Registry SKU."
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "Common tags applied to all resources."
  type        = map(string)
  default = {
    owner      = "sanjay-naidu"
    project    = "project02-ecommerce-aks"
    managed_by = "terraform"
    repo       = "github.com/Sanjay-Naidu/project02-aks-platform-infra"
  }
}
