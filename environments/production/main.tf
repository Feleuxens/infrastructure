locals {
  domain            = "feleuxens.de"
  letsencrypt-email = "sslcerts@feleuxens.de"
}

resource "flux_bootstrap_git" "this" {
  components_extra = []
  path             = "clusters/production"
}

module "ci-serviceaccount" {
  source  = "Feleuxens/ci-serviceaccount/kubernetes"
  version = "0.2.0"

  serviceaccount_name = "ci-user"
}

module "ingress-nginx" {
  source  = "Feleuxens/ingress-nginx/helm"
  version = "0.1.3"

  enable_metrics = "true"
}

module "cert-manager" {
  source  = "Feleuxens/cert-manager/helm"
  version = "0.1.0"

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
}

# module "keycloak" {
#   source  = "Feleuxens/keycloak/helm"
#   version = "0.1.2"

#   domain                  = local.domain
#   keycloak_admin_password = var.feleuxens_keycloak_admin_password
#   postgres_admin_password = var.feleuxens_keycloak_postgres_admin_password
#   postgres_user_password  = var.feleuxens_keycloak_postgres_user_password
#   memory_request          = "768Mi"
#   memory_limit            = "768Mi"
#   cpu_request             = "20m"
# }

# module "firefly" {
#   source  = "Feleuxens/firefly/helm"
#   version = "0.3.1"

#   domain          = local.domain
#   firefly_app_key = var.feleuxens_firefly_app_key
# }

# module "jellyfin" {
#   source  = "Feleuxens/jellyfin/helm"
#   version = "0.2.3"

#   domain      = local.domain
#   cpu_request = "50m"
#   media_size  = "200Gi"
# }

# module "jellyseerr" {
#   source  = "Feleuxens/jellyseerr/helm"
#   version = "0.1.3"

#   domain         = local.domain
#   cpu_request    = "10m"
#   memory_request = "256Mi"
#   memory_limit   = "512Mi"
# }

# module "radarr" {
#   source  = "Feleuxens/radarr/helm"
#   version = "0.1.1"

#   domain      = local.domain
#   volume_size = "20Gi"
# }