terraform {
  required_providers {
    nomad = {
      source  = "hashicorp/nomad"
      version = "2.4.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}

provider "vault" {
  address = var.vault_addr
}

provider "nomad" {
  address = var.nomad_addr
}
