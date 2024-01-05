variable "CLUSTER_HOST" {
  description = "Kubernetes host"
  type        = string
}

variable "CLUSTER_CLIENT_CERT" {
  sensitive   = true
  description = "Kubernetes client certificate"
  type        = string
}

variable "CLUSTER_CLIENT_KEY" {
  sensitive   = true
  description = "Kubernetes client key"
  type        = string
}

variable "CLUSTER_CA_CERT" {
  sensitive   = true
  description = "Kubernetes cluster certificate authoritate certificate"
  type        = string
}

variable "DOMAIN_CF_ACCOUNT" {
  sensitive   = true
  description = "CF Account email address"
  type        = string
  default     = ""
}

variable "DOMAIN_CF_KEY" {
  sensitive   = true
  description = "CF API Key"
  type        = string
  default     = ""
}

variable "CLUSTER_TAILSCALE_OPERATOR_ID" {
  sensitive   = true
  description = "Tailscale operator OAuth Client id"
  type        = string
  default     = ""
}

variable "CLUSTER_TAILSCALE_OPERATOR_SECRET" {
  sensitive   = true
  description = "Tailscale operator OAuth Client secret"
  type        = string
  default     = ""
}

variable "GIT_SSH_URL" {
  type      = string
}

variable "GIT_SSH_PRIVATE_KEY_PEM" {
  sensitive = true
  type = string
}

# variable "feleuxens_firefly_app_key" {
#   description = "Firefly App Key"
#   type        = string
# }

# variable "feleuxens_firefly_pgadmin4_password" {
#   description = "pgadmin4 for Firefly password"
#   type        = string
# }

# variable "feleuxens_grafana_admin_password" {
#   description = "Admin password for Grafana"
#   type        = string
# }

# variable "feleuxens_keycloak_admin_password" {
#   description = "Admin password for Keycloak"
#   type        = string
# }

# variable "feleuxens_keycloak_postgres_user_password" {
#   description = "User password for the Keycloak Postgres instance"
#   type        = string
# }

# variable "feleuxens_keycloak_postgres_admin_password" {
#   description = "Admin password for the Keycloak Postgres instance"
#   type        = string
# }