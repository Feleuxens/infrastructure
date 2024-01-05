locals {
  domain            = "feleuxens.de"
  letsencrypt-email = "sslcerts@feleuxens.de"
}

module "cert-manager" {
  source     = "../../modules/cert-manager"
  email      = local.letsencrypt-email
  cf-email   = var.feleuxens_cf_account
  cf-api-key = var.feleuxens_cf_key
}

module "firefly" {
  source            = "../../modules/firefly"
  domain            = local.domain
  firefly-app-key   = var.feleuxens_firefly_app_key
  pgadmin4-password = var.feleuxens_firefly_pgadmin4_password
}

module "docker-mailserver" {
  source = "../../modules/docker-mailserver"
  domain = local.domain
}

module "kube-prometheus-stack" {
  source                 = "../../modules/kube-prometheus-stack"
  domain                 = local.domain
  grafana-admin-password = var.feleuxens_grafana_admin_password
  #  iot_dashboards_enabled = true
  #  iot_scraping_enabled   = true
}

module "keycloak" {
  source                  = "../../modules/keycloak"
  domain                  = local.domain
  keycloak-admin-password = var.feleuxens_keycloak_admin_password
  postgres-root-password  = var.feleuxens_keycloak_postgres_root_password
  postgres-user-password  = var.feleuxens_keycloak_postgres_user_password
}