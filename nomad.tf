resource "nomad_namespace" "this" {
  name = local.safe_name
}
resource "nomad_acl_policy" "this" {
  name        = local.safe_name
  description = var.namespace

  rules_hcl = <<EOT
  namespace "${nomad_namespace.this.name}" {
  policy       = "read"
  capabilities = ["read-logs","dispatch-job"]
}
EOT
}

resource "nomad_acl_role" "this" {
  name        = local.safe_name
  description = "An ACL Role for ${var.namespace} namespace"

  policy {
    name = nomad_acl_policy.this.name
  }
}


resource "nomad_acl_binding_rule" "vault" {
  description = var.namespace
  auth_method = "vault"
  selector    = "${var.namespace} in list.roles"
  bind_type   = "role"
  bind_name   = local.safe_name
}