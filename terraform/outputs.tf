# ---------------------------------------------------------------------------
# Outputs
# Author : Sanjay Naidu (https://github.com/Sanjay-Naidu/project02-aks-platform-infra)
# ---------------------------------------------------------------------------

output "resource_group_name" {
  description = "Resource group that holds everything."
  value       = azurerm_resource_group.main.name
}

output "acr_name" {
  description = "Azure Container Registry name (used as the ACR_NAME variable in the apps repo's CI)."
  value       = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "ACR login server, e.g. project02acr.azurecr.io."
  value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config_command" {
  description = "Run this to connect kubectl to the cluster."
  value       = "az aks get-credentials --resource-group ${azurerm_resource_group.main.name} --name ${azurerm_kubernetes_cluster.aks.name}"
}
