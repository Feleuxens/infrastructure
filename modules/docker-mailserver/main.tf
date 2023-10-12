resource "helm_release" "docker-mailserver" {
  name = "docker-mailserver"

  repository       = "https://webofmars.github.io/docker-mailserver-helm"
  chart            = "docker-mailserver"
  version          = "2.0.1"
  create_namespace = true
  namespace        = "docker-mailserver"

  values = [
    templatefile("${path.module}/helm-values/docker-mailserver.yaml", { 
      domain : var.domain
    })
  ]
}

# docker-mailserver requires an existing certificate
# for SSL/TLS and STARTTLS
resource "kubernetes_manifest" "mail-tls" {
    manifest = {
        "apiVersion" = "cert-manager.io/v1"
        "kind" = "Certificate"
        "metadata" = {
            "name" = "mail-tls"
            "namespace" = "docker-mailserver"
        }
        "spec" = {
            "secretName" = "mail-tls"
            "dnsNames" = ["mail.${var.domain}"]
            "issuerRef" = {
                "name" = "letsencrypt-prod-dns01"
                "kind" = "ClusterIssuer"
                "group" = "cert-manager.io"
            }
        }
    }
}