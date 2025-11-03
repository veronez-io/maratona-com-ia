variable "project_name" {
  description = "Nome do projeto usado para nomear recursos"
  type        = string
}

variable "region" {
  description = "Região da Digital Ocean"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
}

variable "tags" {
  description = "Tags para aplicar aos recursos"
  type        = list(string)
  default     = ["managed-by:terraform"]
}
