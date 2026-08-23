output "server_id" {
  value = hcloud_server.webapp.id
}

output "server_ipv6" {
  value = hcloud_server.webapp.ipv6_address
}
