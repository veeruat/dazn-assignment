output "lb_dns" {
  value = module.lb.load_balancer_dns
}

output "dazn_app_docker_image_url" {
  value = module.docker_registry.repository_url
}
