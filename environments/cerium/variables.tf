variable "cerium_host" {
  description = "Kubernetes host"
  type        = string
  default     = ""
}

variable "cerium_client_cert" {
  description = "Kubernetes client certificate"
  type        = string
  default     = ""
}

variable "cerium_client_key" {
  description = "Kubernetes client key"
  type        = string
  default     = ""
}

variable "cerium_cluster_ca_cert" {
  description = "Kubernetes cluster certificate authoritate certificate"
  type        = string
  default     = ""
}

variable "feleuxens_cf_account" {
  description = "CF Account email address"
  type        = string
  default     = ""
}

variable "feleuxens_cf_key" {
  description = "CF API Key"
  type        = string
  default     = ""
}

variable "feleuxens_firefly_app_key" {
  description = "Firefly App Key"
  type        = string
}

variable "feleuxens_firefly_pgadmin4_password" {
  description = "pgadmin4 for Firefly password"
  type        = string
}

variable "feleuxens_grafana_admin_password" {
  description = "Admin password for grafana"
  type        = string
}