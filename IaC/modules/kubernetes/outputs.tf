output "cluster_id" {
  description = "ID do cluster Kubernetes"
  value       = digitalocean_kubernetes_cluster.main.id
}

output "cluster_name" {
  description = "Nome do cluster Kubernetes"
  value       = digitalocean_kubernetes_cluster.main.name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster Kubernetes"
  value       = digitalocean_kubernetes_cluster.main.endpoint
}

output "cluster_status" {
  description = "Status do cluster Kubernetes"
  value       = digitalocean_kubernetes_cluster.main.status
}

output "cluster_region" {
  description = "Região do cluster Kubernetes"
  value       = digitalocean_kubernetes_cluster.main.region
}

output "cluster_version" {
  description = "Versão do Kubernetes"
  value       = digitalocean_kubernetes_cluster.main.version
}

output "cluster_ipv4_address" {
  description = "Endereço IPv4 do cluster"
  value       = digitalocean_kubernetes_cluster.main.ipv4_address
}

output "kubeconfig_raw" {
  description = "Kubeconfig em formato raw"
  value       = digitalocean_kubernetes_cluster.main.kube_config[0].raw_config
  sensitive   = true
}

output "kubeconfig_path" {
  description = "Caminho do arquivo kubeconfig salvo localmente"
  value       = local_file.kubeconfig.filename
}

output "node_pool_id" {
  description = "ID do node pool principal"
  value       = digitalocean_kubernetes_cluster.main.node_pool[0].id
}

output "node_pool_nodes" {
  description = "Lista de nodes no pool principal"
  value       = digitalocean_kubernetes_cluster.main.node_pool[0].nodes
}

output "cluster_urn" {
  description = "URN do cluster para referências"
  value       = digitalocean_kubernetes_cluster.main.urn
}
