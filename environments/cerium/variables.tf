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