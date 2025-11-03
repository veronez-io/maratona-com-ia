terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.68.0"
    }
  }
}

# Provider da Digital Ocean
provider "digitalocean" {
  token = var.do_token
}
