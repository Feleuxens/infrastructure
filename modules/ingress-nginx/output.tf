output "ingress_nginx_service_address" {
  value = data.kubernetes_service.ingress_nginx.status.0.load_balancer.0.ingress.0.hostname
}

output "ingress_nginx_service_ip" {
  value = data.kubernetes_service.ingress_nginx.status.0.load_balancer.0.ingress.0.ip
}
