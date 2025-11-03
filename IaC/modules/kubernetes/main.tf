terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.68.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

# Cluster Kubernetes gerenciado (DOKS)
resource "digitalocean_kubernetes_cluster" "main" {
  name    = "${var.project_name}-k8s"
  region  = var.region
  version = var.k8s_version
  vpc_uuid = var.vpc_id

  # High Availability para control plane em produção
  ha = true

  # Node pool principal com auto-scaling
  node_pool {
    name       = "${var.project_name}-worker-pool"
    size       = var.k8s_node_size
    node_count = var.k8s_node_count

    # Configuração de auto-scaling
    auto_scale = var.k8s_auto_scale
    min_nodes  = var.k8s_min_nodes
    max_nodes  = var.k8s_max_nodes

    tags = concat(var.tags, ["node-pool:primary"])

    labels = {
      environment  = "production"
      managed-by   = "terraform"
      cluster-name = "${var.project_name}-k8s"
    }
  }

  # Janela de manutenção: Domingo às 04:00 UTC
  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  # Auto-upgrade habilitado para patches de segurança
  auto_upgrade = true
  surge_upgrade = true

  tags = concat(var.tags, ["cluster:kubernetes"])
}

# Salva o kubeconfig localmente para facilitar acesso ao cluster
resource "local_file" "kubeconfig" {
  content  = digitalocean_kubernetes_cluster.main.kube_config[0].raw_config
  filename = "${path.root}/kubeconfig-${var.project_name}.yaml"
  file_permission = "0600"
}
