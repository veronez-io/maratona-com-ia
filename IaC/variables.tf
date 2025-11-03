# ====================================
# Variáveis Obrigatórias
# ====================================

variable "do_token" {
  description = "Token de API da Digital Ocean"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Nome do projeto (usado em nomes de recursos)"
  type        = string

  validation {
    condition     = length(var.project_name) > 0 && length(var.project_name) <= 32
    error_message = "O nome do projeto deve ter entre 1 e 32 caracteres."
  }
}

variable "region" {
  description = "Região da Digital Ocean (ex: nyc1, sfo3, fra1)"
  type        = string
  default     = "nyc1"
}

# ====================================
# Variáveis de Networking
# ====================================

variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
  default     = "10.10.0.0/16"
}

# ====================================
# Variáveis do Kubernetes
# ====================================

variable "k8s_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "1.33"
}

variable "k8s_node_size" {
  description = "Tamanho dos nodes do cluster"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "k8s_node_count" {
  description = "Número inicial de nodes"
  type        = number
  default     = 3

  validation {
    condition     = var.k8s_node_count >= 1 && var.k8s_node_count <= 10
    error_message = "O número de nodes deve estar entre 1 e 10."
  }
}

variable "k8s_auto_scale" {
  description = "Habilitar auto-scaling"
  type        = bool
  default     = true
}

variable "k8s_min_nodes" {
  description = "Número mínimo de nodes para auto-scaling"
  type        = number
  default     = 2
}

variable "k8s_max_nodes" {
  description = "Número máximo de nodes para auto-scaling"
  type        = number
  default     = 5

  validation {
    condition     = var.k8s_max_nodes >= var.k8s_min_nodes
    error_message = "O número máximo de nodes deve ser maior ou igual ao mínimo."
  }
}

# ====================================
# Variáveis do Database de Produção
# ====================================

variable "db_prod_engine" {
  description = "Engine do database de produção"
  type        = string
  default     = "pg"
}

variable "db_prod_version" {
  description = "Versão do PostgreSQL de produção"
  type        = string
  default     = "18"
}

variable "db_prod_size" {
  description = "Tamanho do node do database de produção"
  type        = string
  default     = "db-s-2vcpu-4gb"
}

variable "db_prod_node_count" {
  description = "Número de nodes do database de produção (2 para HA)"
  type        = number
  default     = 2

  validation {
    condition     = var.db_prod_node_count >= 1 && var.db_prod_node_count <= 3
    error_message = "O número de nodes deve estar entre 1 e 3."
  }
}

variable "db_prod_storage_mb" {
  description = "Armazenamento em MB do database de produção"
  type        = number
  default     = 51200 # 50GB

  validation {
    condition     = var.db_prod_storage_mb >= 10240
    error_message = "O armazenamento mínimo é 10GB (10240 MB)."
  }
}

# ====================================
# Variáveis do Database de Staging
# ====================================

variable "db_staging_engine" {
  description = "Engine do database de staging"
  type        = string
  default     = "pg"
}

variable "db_staging_version" {
  description = "Versão do PostgreSQL de staging"
  type        = string
  default     = "18"
}

variable "db_staging_size" {
  description = "Tamanho do node do database de staging"
  type        = string
  default     = "db-s-1vcpu-2gb"
}

variable "db_staging_node_count" {
  description = "Número de nodes do database de staging (1 para custo otimizado)"
  type        = number
  default     = 1
}

variable "db_staging_storage_mb" {
  description = "Armazenamento em MB do database de staging"
  type        = number
  default     = 25600 # 25GB

  validation {
    condition     = var.db_staging_storage_mb >= 10240
    error_message = "O armazenamento mínimo é 10GB (10240 MB)."
  }
}

# ====================================
# Variáveis Gerais
# ====================================

variable "tags" {
  description = "Tags para aplicar aos recursos"
  type        = list(string)
  default     = ["managed-by:terraform"]
}
