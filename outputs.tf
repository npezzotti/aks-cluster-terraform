output "kube_config" {
  description = "AKS cluster kubeconfig"
  value       = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive   = true
}

output "fqdn" {
  description = "AKS cluster fqdn"
  value       = azurerm_kubernetes_cluster.main.fqdn
}

output "kubernetes_cluster_name" {
  description = "Kubernetes Cluster name"
  value       = azurerm_kubernetes_cluster.main.name
}
