resource "kubernetes_namespace" "firefly-ns" {
    metadata {
        name = "firefly"
    }
}

resource "helm_release" "firefly-db" {
    name = "firefly-db"

    repository = "https://firefly-iii.github.io/kubernetes"
    chart = "firefly-db"
    create_namespace = false
    namespace = "firefly"
    wait = false

    values = [
        templatefile("${path.module}/helm-values/firefly-db.yaml", {
        })
    ]

    depends_on = [ kubernetes_namespace.firefly-ns ]
}

resource "helm_release" "firefly" {
    name = "firefly"

    repository = "https://firefly-iii.github.io/kubernetes"
    chart = "firefly-iii"
    create_namespace = false
    namespace = "firefly"

    values = [
        templatefile("${path.module}/helm-values/firefly.yaml", {
            domain: var.domain,
        })
    ]
    set_sensitive {
      name = "secrets.env.APP_KEY"
      value = var.firefly-app-key
    }

    depends_on = [ kubernetes_namespace.firefly-ns ]
}

# requires to be edited by hand. Token can be found under /profile
resource "kubernetes_secret" "firefly-cron-web-token" {
    metadata {
        name = "letsencrypt-prod-cf-api-key"
        namespace = helm_release.firefly.namespace
    }
    type = "Opaque"
    data = {
        token = "TOKEN"
    }
  
}

resource "helm_release" "firefly-pgadmin" {
  name = "firefly-pgadmin"

  repository = "https://helm.runix.net"
  chart = "pgadmin4"
  create_namespace = false
  namespace = helm_release.firefly.namespace

  values = [
    templatefile("${path.module}/helm-values/firefly-pgadmin.yaml", {
        domain: var.domain,
    })
  ]

  set_sensitive {
    name = "env.password"
    value = var.pgadmin4-password
  }
}