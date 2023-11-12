resource "helm_release" "kube-prometheus-stack" {
  name = "kube-prometheus-stack"

  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "53.0.0"
  create_namespace = true
  namespace        = "kube-prometheus-stack"

  values = [
    templatefile("${path.module}/helm-values/kube-prometheus-stack.yaml", {
      domain : var.domain,
    })
  ]
  set_sensitive {
    name  = "grafana.adminPassword"
    value = var.grafana-admin-password
  }
}