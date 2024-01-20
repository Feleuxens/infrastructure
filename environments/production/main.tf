locals {
  domain            = "feleuxens.de"
  letsencrypt-email = "sslcerts@feleuxens.de"
}

resource "flux_bootstrap_git" "this" {
  components_extra = ["image-reflector-controller", "image-automation-controller"]
  path             = "clusters/production"
}

module "ci-serviceaccount" {
  source  = "Feleuxens/ci-serviceaccount/kubernetes"
  version = "0.2.0"

  serviceaccount_name = "ci-user"
}

module "ingress-nginx" {
  source  = "Feleuxens/ingress-nginx/helm"
  version = "0.1.4"

  enable_metrics = "true"
  allow_snippet_annotations = "true"
}

module "cert-manager" {
  source  = "Feleuxens/cert-manager/helm"
  version = "0.1.1"

  email      = local.letsencrypt-email
  cf_email   = var.DOMAIN_CF_ACCOUNT
  cf_api_key = var.DOMAIN_CF_KEY
}

module "longhorn" {
  source  = "Feleuxens/longhorn/helm"
  version = "0.1.0"

  default_class_replica_count   = 1
  csi_attacher_replica_count    = 2
  csi_provisioner_replica_count = 2
  csi_resizer_replica_count     = 2
  csi_snapshotter_replica_count = 2
  longhornui_replicas           = 1
}

module "tailscale-operator" {
  source  = "Feleuxens/tailscale-operator/helm"
  version = "0.1.0"

  tailscale_operator_id     = var.CLUSTER_TAILSCALE_OPERATOR_ID
  tailscale_operator_secret = var.CLUSTER_TAILSCALE_OPERATOR_SECRET

  depends_on = [ module.longhorn ]
}