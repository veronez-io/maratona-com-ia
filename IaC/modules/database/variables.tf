variable "project_name" {
  description = "Nome do projeto usado para nomear recursos"
  type        = string
}

variable "region" {
  description = "Região da Digital Ocean"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o database será criado"
  type        = string
}

variable "environment" {
  description = "Ambiente (production ou staging)"
  type        = string
  validation {
    condition     = contains(["production", "staging"], var.environment)
    error_message = "Environment deve ser 'production' ou 'staging'."
  }
}

variable "db_engine" {
  description = "Engine do database"
  type        = string
  default     = "pg"
}

variable "db_version" {
  description = "Versão do PostgreSQL"
  type        = string
  default     = "18"
}

variable "db_size" {
  description = "Tamanho do node do database"
  type        = string
}

variable "db_node_count" {
  description = "Número de nodes (1 para single, 2+ para HA)"
  type        = number
}

variable "db_storage_mb" {
  description = "Armazenamento em MB"
  type        = number
}

variable "db_name" {
  description = "Nome do database a ser criado"
  type        = string
}

variable "tags" {
  description = "Tags para aplicar aos recursos"
  type        = list(string)
  default     = ["managed-by:terraform"]
}
