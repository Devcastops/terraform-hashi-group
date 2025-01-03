variable "namespace" {
  type = string
}

variable "users" {
  type = set(string)
}

variable "vault_addr" {
  type        = string
  description = "The address for the vault cluster"
}

variable "nomad_addr" {
  type        = string
  description = "The address for the nomad cluster"
}