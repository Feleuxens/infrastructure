provider "kubernetes" {
  host                   = var.CLUSTER_HOST
  client_certificate     = base64decode(var.CLUSTER_CLIENT_CERT)
  client_key             = base64decode(var.CLUSTER_CLIENT_KEY)
  cluster_ca_certificate = base64decode(var.CLUSTER_CA_CERT)
}

provider "helm" {
  kubernetes {
    host                   = var.CLUSTER_HOST
    client_certificate     = base64decode(var.CLUSTER_CLIENT_CERT)
    client_key             = base64decode(var.CLUSTER_CLIENT_KEY)
    cluster_ca_certificate = base64decode(var.CLUSTER_CA_CERT)
  }
}

provider "flux" {
  kubernetes = {
    host                   = var.CLUSTER_HOST
    client_certificate     = base64decode(var.CLUSTER_CLIENT_CERT)
    client_key             = base64decode(var.CLUSTER_CLIENT_KEY)
    cluster_ca_certificate = base64decode(var.CLUSTER_CA_CERT)
  }
  git = {
    url = var.GIT_SSH_URL
    ssh = {
      username    = "git"
      private_key = var.GIT_SSH_PRIVATE_KEY
    }
  }
}