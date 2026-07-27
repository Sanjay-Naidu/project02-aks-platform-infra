# project02-aks-platform-infra

Terraform-provisioned Azure Kubernetes Service (AKS) platform infrastructure — AKS cluster, Azure Container
Registry, and networking, deployed via GitHub Actions with OIDC (passwordless) authentication. Infra layer
for a production-mirror microservices project.

Maintained by **Sanjay Naidu** — https://github.com/Sanjay-Naidu/project02-aks-platform-infra

Part of a 3-repo project:
- **`project02-aks-platform-infra`** (this repo) — Terraform: AKS cluster + Azure Container Registry
- [`project02-aks-microservices-apps`](https://github.com/Sanjay-Naidu/project02-aks-microservices-apps) — application source + CI
- [`project02-aks-gitops-manifests`](https://github.com/Sanjay-Naidu/project02-aks-gitops-manifests) — Helm/ArgoCD manifests, watched by ArgoCD for GitOps CD

## What this provisions

- Resource group (`project02-rg`)
- Azure Container Registry, Basic SKU (`project02acr`)
- AKS cluster (`project02-aks`), 1 node, `Standard_D2s_v7`, system-assigned managed identity
- A role assignment granting the AKS kubelet identity `AcrPull` on the registry — nodes can pull images
  without any embedded registry credentials

Node count is deliberately fixed and minimal for this phase — sizing will be revisited once ingress-nginx,
ArgoCD, and the monitoring stack are added in later phases and need more headroom.

## Setup

1. Create remote state storage (resource group + storage account + `tfstate` container) — see the repo's
   Terraform recap for the exact click-path, same pattern as the original AKS showcase project.
2. Register an Entra ID app + 3 federated (OIDC) credentials trusting this repo (branch `main`, `pull_request`,
   environment `production`) — no client secret stored anywhere.
3. Assign the app **Contributor** on the subscription and **Storage Blob Data Contributor** on the state
   storage account.
4. Add repo secrets `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID` and repo variables
   `TFSTATE_RG`, `TFSTATE_SA`, `TFSTATE_CONTAINER`. Create a `production` environment with yourself as a
   required reviewer.
5. Open a PR to see `terraform plan`; merge to `main` and approve the environment gate to `apply`.

## Cost discipline

This is a free-trial Azure subscription (~$150 budget). Use the manual, approval-gated **Terraform Destroy**
workflow to tear everything down between working sessions rather than leaving the cluster running.

---
_Author: Sanjay Naidu · https://github.com/Sanjay-Naidu_
