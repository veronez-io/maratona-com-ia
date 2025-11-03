# Módulo de Networking - VPC
module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  region       = var.region
  vpc_cidr     = var.vpc_cidr
  tags         = var.tags
}

# Módulo de Kubernetes - DOKS
module "kubernetes" {
  source = "./modules/kubernetes"

  project_name   = var.project_name
  region         = var.region
  vpc_id         = module.networking.vpc_id
  k8s_version    = var.k8s_version
  k8s_node_size  = var.k8s_node_size
  k8s_node_count = var.k8s_node_count
  k8s_auto_scale = var.k8s_auto_scale
  k8s_min_nodes  = var.k8s_min_nodes
  k8s_max_nodes  = var.k8s_max_nodes
  tags           = var.tags

  depends_on = [module.networking]
}

# Módulo de Database - Produção
module "database_production" {
  source = "./modules/database"

  project_name  = var.project_name
  region        = var.region
  vpc_id        = module.networking.vpc_id
  environment   = "production"
  db_engine     = var.db_prod_engine
  db_version    = var.db_prod_version
  db_size       = var.db_prod_size
  db_node_count = var.db_prod_node_count
  db_storage_mb = var.db_prod_storage_mb
  db_name       = "${var.project_name}_prod"
  tags          = var.tags

  depends_on = [module.networking]
}

# Módulo de Database - Staging
module "database_staging" {
  source = "./modules/database"

  project_name  = var.project_name
  region        = var.region
  vpc_id        = module.networking.vpc_id
  environment   = "staging"
  db_engine     = var.db_staging_engine
  db_version    = var.db_staging_version
  db_size       = var.db_staging_size
  db_node_count = var.db_staging_node_count
  db_storage_mb = var.db_staging_storage_mb
  db_name       = "${var.project_name}_staging"
  tags          = var.tags

  depends_on = [module.networking]
}
