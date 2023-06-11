provider "kubernetes" {
  host                   = var.cerium_host
  client_certificate     = base64decode(var.cerium_client_cert)
  client_key             = base64decode(var.cerium_client_key)
  cluster_ca_certificate = base64decode(var.cerium_cluster_ca_cert)
}

provider "helm" {
  kubernetes {
    host                   = var.cerium_host
    client_certificate     = base64decode(var.cerium_client_cert)
    client_key             = base64decode(var.cerium_client_key)
    cluster_ca_certificate = base64decode(var.cerium_cluster_ca_cert)
  }
}