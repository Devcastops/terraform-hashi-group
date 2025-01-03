data "vault_identity_entity" "this" {
  for_each    = var.users
  entity_name = each.key
}

resource "vault_identity_group" "this" {
  name              = var.namespace
  type              = "internal"
  policies          = [vault_policy.this.name]
  member_entity_ids = [for k, v in data.vault_identity_entity.this : v.id]
}

resource "vault_policy" "this" {
  name = var.namespace

  policy = <<EOT
path "${local.safe_name}" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "${local.safe_name}/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}