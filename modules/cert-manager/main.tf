resource "helm_release" "cert_manager" {
  name = "cert-manager"

  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.13.3"
  create_namespace = true
  namespace        = "cert-manager"
  values           = [file("${path.module}/helm-values/cert-manager.yaml")]
  set {
    name  = "installCRDs"
    value = true
  }
  set {
    name  = "serviceAccount.create"
    value = "true"
  }
}

resource "helm_release" "k8s_cluster_issuer" {
  name = "cert-manager-cluster-issuer"

  repository       = "https://bedag.github.io/helm-charts"
  chart            = "raw"
  create_namespace = true
  namespace        = helm_release.cert_manager.namespace
  values = [
    templatefile("${path.module}/helm-values/cluster-issuer.yaml", {
      email : var.email,
      cf-email : var.cf-email
    })
  ]

  depends_on = [kubernetes_secret.cf-api-key]
}

resource "kubernetes_secret" "cf-api-key" {
  metadata {
    name      = "letsencrypt-prod-cf-api-key"
    namespace = helm_release.cert_manager.namespace
  }
  type = "Opaque"
  data = {
    cf-api-key = var.cf-api-key
  }

}