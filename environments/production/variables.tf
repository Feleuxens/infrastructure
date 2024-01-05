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
  type = string
}

variable "GIT_SSH_PRIVATE_KEY" {
  sensitive = true
  type      = string
}