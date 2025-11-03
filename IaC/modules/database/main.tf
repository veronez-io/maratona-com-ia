terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.68.0"
    }
  }
}

# Database PostgreSQL gerenciado
resource "digitalocean_database_cluster" "main" {
  name       = "${var.project_name}-db-${var.environment}"
  engine     = var.db_engine
  version    = var.db_version
  size       = var.db_size
  region     = var.region
  node_count = var.db_node_count

  # Private networking na mesma VPC do cluster Kubernetes
  private_network_uuid = var.vpc_id

  # Storage configurável
  storage_size_mib = var.db_storage_mb

  # Janela de manutenção
  # Produção: Domingo 03:00 UTC
  # Staging: Sábado 03:00 UTC
  maintenance_window {
    day  = var.environment == "production" ? "sunday" : "saturday"
    hour = "03:00:00"
  }

  tags = concat(var.tags, ["environment:${var.environment}", "database:postgresql"])
}

# Database inicial
resource "digitalocean_database_db" "main" {
  cluster_id = digitalocean_database_cluster.main.id
  name       = var.db_name
}

# Usuário dedicado para aplicação
resource "digitalocean_database_user" "app_user" {
  cluster_id = digitalocean_database_cluster.main.id
  name       = "${var.project_name}_${var.environment}_user"
}

# Configuração de connection pool com PgBouncer
resource "digitalocean_database_connection_pool" "pool" {
  cluster_id = digitalocean_database_cluster.main.id
  name       = "${var.project_name}-pool"
  mode       = "transaction"
  size       = 25
  db_name    = digitalocean_database_db.main.name
  user       = digitalocean_database_user.app_user.name
}

# Firewall para database - permite apenas acesso da VPC
resource "digitalocean_database_firewall" "main" {
  cluster_id = digitalocean_database_cluster.main.id

  # Permite acesso apenas da VPC
  rule {
    type  = "tag"
    value = "cluster:kubernetes"
  }
}
