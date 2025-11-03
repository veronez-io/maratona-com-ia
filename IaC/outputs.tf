# ====================================
# Outputs de Networking
# ====================================

output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.networking.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block da VPC"
  value       = module.networking.vpc_cidr
}

output "vpc_region" {
  description = "Região da VPC"
  value       = module.networking.vpc_region
}

# ====================================
# Outputs do Cluster Kubernetes
# ====================================

output "cluster_id" {
  description = "ID do cluster Kubernetes"
  value       = module.kubernetes.cluster_id
}

output "cluster_name" {
  description = "Nome do cluster Kubernetes"
  value       = module.kubernetes.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster Kubernetes"
  value       = module.kubernetes.cluster_endpoint
}

output "cluster_status" {
  description = "Status do cluster Kubernetes"
  value       = module.kubernetes.cluster_status
}

output "cluster_region" {
  description = "Região do cluster Kubernetes"
  value       = module.kubernetes.cluster_region
}

output "cluster_version" {
  description = "Versão do Kubernetes"
  value       = module.kubernetes.cluster_version
}

output "cluster_ipv4_address" {
  description = "Endereço IPv4 do cluster"
  value       = module.kubernetes.cluster_ipv4_address
}

output "kubeconfig_raw" {
  description = "Kubeconfig em formato raw - Use 'terraform output -raw kubeconfig_raw > kubeconfig.yaml'"
  value       = module.kubernetes.kubeconfig_raw
  sensitive   = true
}

output "kubeconfig_path" {
  description = "Caminho do arquivo kubeconfig salvo localmente"
  value       = module.kubernetes.kubeconfig_path
}

output "node_pool_id" {
  description = "ID do node pool principal"
  value       = module.kubernetes.node_pool_id
}

# ====================================
# Outputs do Database de Produção
# ====================================

output "db_prod_id" {
  description = "ID do cluster de database de produção"
  value       = module.database_production.db_id
}

output "db_prod_host" {
  description = "Host público do database de produção"
  value       = module.database_production.db_host
}

output "db_prod_private_host" {
  description = "Host privado do database de produção (VPC)"
  value       = module.database_production.db_private_host
}

output "db_prod_port" {
  description = "Porta do database de produção"
  value       = module.database_production.db_port
}

output "db_prod_database_name" {
  description = "Nome do database de produção"
  value       = module.database_production.db_database_name
}

output "db_prod_user" {
  description = "Usuário do database de produção"
  value       = module.database_production.db_user
}

output "db_prod_password" {
  description = "Senha do database de produção - Use 'terraform output -raw db_prod_password'"
  value       = module.database_production.db_password
  sensitive   = true
}

output "db_prod_uri" {
  description = "URI de conexão do database de produção (público)"
  value       = module.database_production.db_uri
  sensitive   = true
}

output "db_prod_private_uri" {
  description = "URI de conexão do database de produção (privado) - RECOMENDADO"
  value       = module.database_production.db_private_uri
  sensitive   = true
}

output "db_prod_connection_pool_uri" {
  description = "URI do connection pool de produção (privado)"
  value       = module.database_production.connection_pool_private_uri
  sensitive   = true
}

# ====================================
# Outputs do Database de Staging
# ====================================

output "db_staging_id" {
  description = "ID do cluster de database de staging"
  value       = module.database_staging.db_id
}

output "db_staging_host" {
  description = "Host público do database de staging"
  value       = module.database_staging.db_host
}

output "db_staging_private_host" {
  description = "Host privado do database de staging (VPC)"
  value       = module.database_staging.db_private_host
}

output "db_staging_port" {
  description = "Porta do database de staging"
  value       = module.database_staging.db_port
}

output "db_staging_database_name" {
  description = "Nome do database de staging"
  value       = module.database_staging.db_database_name
}

output "db_staging_user" {
  description = "Usuário do database de staging"
  value       = module.database_staging.db_user
}

output "db_staging_password" {
  description = "Senha do database de staging - Use 'terraform output -raw db_staging_password'"
  value       = module.database_staging.db_password
  sensitive   = true
}

output "db_staging_uri" {
  description = "URI de conexão do database de staging (público)"
  value       = module.database_staging.db_uri
  sensitive   = true
}

output "db_staging_private_uri" {
  description = "URI de conexão do database de staging (privado) - RECOMENDADO"
  value       = module.database_staging.db_private_uri
  sensitive   = true
}

output "db_staging_connection_pool_uri" {
  description = "URI do connection pool de staging (privado)"
  value       = module.database_staging.connection_pool_private_uri
  sensitive   = true
}

