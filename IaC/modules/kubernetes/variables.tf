variable "project_name" {
  description = "Nome do projeto usado para nomear recursos"
  type        = string
}

variable "region" {
  description = "Região da Digital Ocean"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o cluster será criado"
  type        = string
}

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
}

variable "tags" {
  description = "Tags para aplicar aos recursos"
  type        = list(string)
  default     = ["managed-by:terraform"]
}
