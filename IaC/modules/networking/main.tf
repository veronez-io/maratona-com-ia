terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.68.0"
    }
  }
}

# VPC para isolamento de rede
resource "digitalocean_vpc" "main" {
  name        = "${var.project_name}-vpc"
  region      = var.region
  description = "VPC privada para ${var.project_name}"
}
