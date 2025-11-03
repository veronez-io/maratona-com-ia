output "vpc_id" {
  description = "ID da VPC criada"
  value       = digitalocean_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block da VPC"
  value       = digitalocean_vpc.main.ip_range
}

output "vpc_region" {
  description = "Região da VPC"
  value       = digitalocean_vpc.main.region
}

output "vpc_urn" {
  description = "URN da VPC para referências"
  value       = digitalocean_vpc.main.urn
}
