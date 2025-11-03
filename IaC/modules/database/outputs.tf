output "db_id" {
  description = "ID do cluster de database"
  value       = digitalocean_database_cluster.main.id
}

output "db_host" {
  description = "Host público do database"
  value       = digitalocean_database_cluster.main.host
}

output "db_private_host" {
  description = "Host privado do database (VPC)"
  value       = digitalocean_database_cluster.main.private_host
}

output "db_port" {
  description = "Porta do database"
  value       = digitalocean_database_cluster.main.port
}

output "db_database_name" {
  description = "Nome do database"
  value       = digitalocean_database_db.main.name
}

output "db_user" {
  description = "Usuário do database"
  value       = digitalocean_database_user.app_user.name
}

output "db_password" {
  description = "Senha do usuário do database"
  value       = digitalocean_database_user.app_user.password
  sensitive   = true
}

output "db_uri" {
  description = "URI de conexão completa (público)"
  value       = digitalocean_database_cluster.main.uri
  sensitive   = true
}

output "db_private_uri" {
  description = "URI de conexão completa (privado)"
  value       = digitalocean_database_cluster.main.private_uri
  sensitive   = true
}

output "db_urn" {
  description = "URN do database cluster"
  value       = digitalocean_database_cluster.main.urn
}

output "connection_pool_host" {
  description = "Host do connection pool"
  value       = digitalocean_database_connection_pool.pool.host
}

output "connection_pool_port" {
  description = "Porta do connection pool"
  value       = digitalocean_database_connection_pool.pool.port
}

output "connection_pool_uri" {
  description = "URI do connection pool"
  value       = digitalocean_database_connection_pool.pool.uri
  sensitive   = true
}

output "connection_pool_private_uri" {
  description = "URI privada do connection pool"
  value       = digitalocean_database_connection_pool.pool.private_uri
  sensitive   = true
}
