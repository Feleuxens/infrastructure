variable "domain" {
  description = "Domain name"
  type        = string
}

variable "keycloak-admin-password" {
  description = "Keycloak Admin Password"
  type        = string
}

variable "postgres-root-password" {
  description = "Postgres root password"
  type = string
}

variable "postgres-user-password" {
  description = "Postgres user password"
  type = string
}