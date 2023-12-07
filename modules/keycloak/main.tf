resource "helm_release" "keycloak" {
  name = "keycloak"

  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "keycloak"
  version          = "17.3.6"
  create_namespace = true
  namespace        = "keycloak"

  values = [
    templatefile("${path.module}/helm-values/keycloak.yaml", {
      domain : var.domain,
    })
  ]
  set_sensitive {
    name  = "auth.adminPassword"
    value = var.keycloak-admin-password
  }
  set_sensitive {
    name = "postgres.auth.postgresPassword"
    value = var.postgres-root-password
  }
  set_sensitive {
    name = "postgres.auth.password"
    value = var.postgres-user-password
  }
}