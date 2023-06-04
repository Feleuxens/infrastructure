resource "helm_release" "ingress_nginx" {
    name = "ingress-nginx"

    repository = "https://kubernetes.github.io/ingress-nginx"
    chart = "ingress-nginx"
    create_namespace = true
    namespace = "ingress-nginx"

    values = [
        templatefile("${path.modules}/helm-values/ingress_nginx.yaml", {
            domain: var.domain,
        })
    ]

    set {
        name = "controller.metrics.enabled"
        value = var.metrics_enabled
    }
}

data "kubernetes_service" "ingress_nginx" {
    metadata {
      name = "${helm_release.ingress_nginx.metadata.0.name}-controller"
      namespaspace = helm_release.ingress_nginx.metadata.0.namespace
    }
}